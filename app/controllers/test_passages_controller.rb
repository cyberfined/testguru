class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: %i[show result update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def show
  end

  def result
  end

  def update
    @test_passage.submit_answer!(params[:answer_ids])
    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def rescue_with_record_not_found(exception)
    render plain: exception.message
  end
end
