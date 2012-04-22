module Admin
  class CategoriesController < ApplicationController
    respond_to :html

    http_basic_authenticate_with :name => "admin", :password => "admin", :realm => "Hackerboard Admin"

    before_filter :find_category, :only => [:edit, :update, :remove, :destroy]

    def index
      @categories = Category.scoped
    end

    def edit
    end

    def update
      @category.update_attributes(params[:category])
      respond_with(@category, :location => admin_categories_path)
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.create(params[:category])
      respond_with(@category, :location => admin_categories_path)
    end

    def remove
    end

    def destroy
      @category.destroy
      respond_with(@category, :location => admin_categories_path)
    end

    private
    def find_category
      @category = Category.find(params[:id])
    end
  end
end
