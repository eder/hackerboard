class CommentForm
  def initialize(question, is_logged)
    @question = question
    @is_logged = is_logged
  end

  def to_partial
    if @is_logged
      ["comments/form", :question => @question]
    else
      ["comments/require_login"]
    end
  end
end
