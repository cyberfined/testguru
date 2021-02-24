class GistsController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    test_passage = TestPassage.find(params[:test_passage_id])

    gist_service = GistQuestionService.new(test_passage.current_question)
    gist_info = gist_service.call

    if gist_service.success?
      gist = Gist.create({ user: test_passage.user, question: test_passage.current_question,
                           git_hash: gist_info.git_hash, url: gist_info.url })
      flash_params = { notice: I18n.t('successful-gist-creation', link: helpers.gist_link(gist)) }
    else
      flash_params = { alert: I18n.t('unsuccessful-gist-creation') }
    end

    redirect_to test_passage, flash_params
  end
end
