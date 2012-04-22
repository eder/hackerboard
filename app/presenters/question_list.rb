class QuestionList
  attr_reader :questions

  def initialize(questions)
    @questions = questions.all
  end

  def categories
    Category.all
  end

  def users
    User.recent
  end

  def to_partial
    if @questions && @questions.any?
      "questions/questions"
    else
      "questions/no_questions"
    end
  end
end
