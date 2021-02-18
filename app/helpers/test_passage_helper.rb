module TestPassageHelper
  def passage_result_message(test_passage)
    if @test_passage.successful?
      message = "successful pass"
      cls = "successful_msg"
    else
      message = "unsuccessful pass"
      cls = "unsuccessful_msg"
    end
    content_tag(:p, message, class: cls)
  end
end
