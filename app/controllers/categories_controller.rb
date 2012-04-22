class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @question_list = CategoryQuestionList.new(@category, params)
  end
end
