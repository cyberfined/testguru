class TestsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :find_test, only: %i[edit show update destroy start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def index
    @tests = Test.all
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def show
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to :tests
  end

  def start
    passage = current_user.test_passage(@test) || current_user.test_passages.create(test: @test)
    redirect_to passage
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :creator_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_record_not_found(exception)
    render plain: exception.message
  end
end
