class CommentsController < ApplicationController
  require_logged_user

  def create
    @question = Question.find(params[:question_id])
    @comment = @question.comments.new(params[:comment])
    @comment.user = current_user

    if @comment.save
      flash[:notice] = t("flash.comment.create")
    else
      flash[:alert] = t("flash.comment.fail")
    end

    redirect_to question_path(@question)
  end
end
