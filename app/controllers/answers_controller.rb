class AnswersController < ApplicationController
  before_action :find_answer, only: :show

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def show
  end

  private

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def rescue_with_record_not_found(exception)
    render plain: exception.message
  end
end
