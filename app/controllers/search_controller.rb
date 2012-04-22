class SearchController < ApplicationController
  rescue_from Riddle::ConnectionError do
    render :text => "Search is down. :("
  end

  def questions
    @questions = Question.search(params[:query], :page => params[:page], :per_page => 3)
    render :default
  end
end
