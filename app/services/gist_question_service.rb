class GistQuestionService
  GITHUB_ACCESS_TOKEN = Rails.application.credentials.aws[:github_access_token].freeze

  def initialize(question, client: nil)
    @client = client || Octokit::Client.new(access_token: GITHUB_ACCESS_TOKEN)
    @question = question
  end

  def call
    client_gist_info = @client.create_gist(gist_params)
    Struct.new(:git_hash, :url).new(client_gist_info.id, client_gist_info.html_url)
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
    content = [@question.statement]
    content += @question.answers.pluck(:statement)
    content.join("\n")
  end
end
