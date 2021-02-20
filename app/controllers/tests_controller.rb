class TestsController < ApplicationController
  before_action :authenticate_user!, only: :start
  before_action :find_test, only: %i[show start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def index
    @tests = Test.all
  end

  def show
  end

  def start
    passage = current_user.test_passage(@test) || current_user.test_passages.create(test: @test)
    redirect_to passage
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_record_not_found(exception)
    render plain: exception.message
  end
end
