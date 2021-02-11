class AnswersController < ApplicationController
  before_action :find_answer, only: %i[edit show update destroy]
  before_action :find_question, only: %i[create new]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def create
    @answer = @question.answers.build(answer_params)
    if @answer.save
      redirect_to @question
    else
      render :new
    end
  end

  def new
    @answer = @question.answers.new
  end

  def edit
  end

  def show
  end

  def update
    if @answer.update(answer_params)
      redirect_to @answer.question
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to @answer.question
  end

  private

  def answer_params
    params.require(:answer).permit(:statement, :correct)
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def rescue_with_record_not_found(exception)
    render plain: exception.message
  end
end
