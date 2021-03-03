class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show result update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def show
  end

  def result
    @test_passage.force_complete! unless @test_passage.completed?
  end

  def update
    if @test_passage.time_over?
      reward_user
      redirect_to result_test_passage_path(@test_passage)
      return
    end

    @test_passage.submit_answer!(params[:answer_ids])
    if @test_passage.completed?
      reward_user
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def reward_user
    badge_service = BadgeService.new(@test_passage)
    badge_service.call
  end
  
  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def rescue_with_record_not_found(exception)
    render plain: exception.message
  end
end
