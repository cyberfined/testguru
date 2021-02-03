module QuestionHelper
  def question_header(action, test_title)
    header = if action == 'new'
               "Create new #{test_title} question"
             else
               "Edit #{test_title} question"
             end
    content_tag(:h1, header)
  end
end
