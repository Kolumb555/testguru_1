module QuestionsHelper

  def question_header(question)
    if question.present?
      "Edit #{question.test.title} Question"
    else
      "New #{question.test.title} Question"
    end
  end

end
