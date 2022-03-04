class CategoriesController < ApplicationController
  before_action :require_admin


  def new
        @category = Category.new
      end
    
      def create
        @category = Category.new(category_params)
        if @category.save
          flash[:notice] = "Category was successfully created"
          redirect_to categories_path
        else
          render 'new', status: :bad_request
        end
      end
    
      def edit
        @category = Category.find(params[:id])
      end
    
      def update
        @category = Category.find(params[:id])
        if @category.update(category_params)
          
          redirect_to categories_path
        else
          render 'edit' ,status: :bad_request
        end
      end
    
      def index
        @categories = Category.order(:id)
      end
    
    #   def show
    #     @category = Category.find(params[:id])
    #     @articles = @category.articles.paginate(page: params[:page], per_page: 5)
    #   end


      def destroy 
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to categories_path

      end
      
      private
    
      def category_params
        params.require(:category).permit(:name , :is_active)
      end
    


end
