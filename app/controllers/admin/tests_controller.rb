class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def index
    @tests = Test.all
  end

  def create
    @test = Test.new(test_params.merge(creator_id: current_user.id))
    if @test.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @test.destroy
    redirect_to :admin_tests
  end

  private

  def test_params
    t_params = params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_record_not_found(exception)
    render plain: exception.message
  end
end
