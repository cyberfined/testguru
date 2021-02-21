class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show result update gist]

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

  def gist
    gist_info = GistQuestionService.new(@test_passage.current_question).call
    gist = Gist.create({ user: @test_passage.user, question: @test_passage.current_question,
                         url: gist_info[:html_url] })
    flash_params = if gist.save
                     { notice: "Gist #{gist_info[:html_url]} was succesfully created" }
                   else
                     { alert: "Gist creation was failed" }
                   end
    redirect_to @test_passage, flash_params
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def rescue_with_record_not_found(exception)
    render plain: exception.message
  end
end
