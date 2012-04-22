class QuestionsController < ApplicationController
  require_logged_user :only => [:new, :create]
  before_filter :find_categories, :only => [:new, :create]

  def index
    @question_list = QuestionList.new(FilteredQuestion.filter(params))
  end

  def feed
    @questions = Question.feed

    respond_to do |format|
      format.xml# { render :xml => @questions }
      format.json { render :json => @questions }
    end
  end

  def show
    @question = Question.find(params[:id])
    @question.viewed!
    @comments = @question.comments.includes(:user)
    @comment_form = CommentForm.new(@question, logged_in?)
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(params[:question])

    if @question.save
      redirect_to question_path(@question), :notice => t("flash.question.create")
    else
      render :new
    end
  end

  private
  def find_categories
    @categories = Category.sorted
  end
end
