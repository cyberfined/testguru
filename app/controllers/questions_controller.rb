class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show edit destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def index
  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to :test_questions
    else
      render :new
    end
  end

  def edit
    @test = @question.test
  end

  def update
  end

  def show
    render plain: @question.statement
  end

  def destroy
    @question.destroy!
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_record_not_found(exception)
    render plain: exception.message
  end

  def question_params
    params.require(:question).permit(:statement)
  end
end
