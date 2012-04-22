class FilteredQuestion
  attr_accessor :params

  def self.filter(params)
    new(params).filter
  end

  def initialize(params)
    @params = params
  end

  def filter
    scope = Question.paginate(params[:page]).recent
    scope = scope.unanswered if params[:filter] == "unanswered"
    scope
  end
end
