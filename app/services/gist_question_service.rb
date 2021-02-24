class GistQuestionService
  GITHUB_ACCESS_TOKEN = Rails.application.credentials.aws[:github_access_token]

  GistInfo = Struct.new(:git_hash, :url)

  def initialize(question, client: nil)
    @client = client || Octokit::Client.new(access_token: GITHUB_ACCESS_TOKEN)
    @question = question
  end

  def call
    client_gist_info = @client.create_gist(gist_params)
    GistInfo.new(client_gist_info.id, client_gist_info.html_url)
  end

  def success?
    @client.last_response&.status == 201
  end

  private

  def gist_params
    { description: I18n.t('question-gist-description', statement: @question.statement),
      files: { question: { content: question_content }},
      public: false
    }
  end

  def question_content
    [@question.statement, *@question.answers.pluck(:statement)].join("\n")
  end
end
