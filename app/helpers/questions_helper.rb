module QuestionsHelper
  def question_header(question)
    "#{action = question.new_record? ? 'Create New' : 'Edit'} #{question.test.title} Question"
  end
end
