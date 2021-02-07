module QuestionHelper
  def question_header(question)
    header = if question.persisted?
               "Edit #{question.test.title} question"
             else
               "Create new #{question.test.title} question"
             end
    content_tag(:h1, header)
  end
end
