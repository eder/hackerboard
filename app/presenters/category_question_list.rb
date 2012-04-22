class CategoryQuestionList < QuestionList
  def initialize(category, params)
    scope = category.questions.recent.paginate(params[:page])
    super(scope)
  end
end
