class PostsController < ApplicationController
    before_action :require_user, except: [:show, :index ]

    def index 
        @posts = Post.paginate(page: params[:page], per_page: 3)
    end

    def new 
        @post = Post.new
    end

    def create
        @post = Post.new(post_params) 
        @post.user_id = session[:user_id] 
        if @post.save
            redirect_to posts_path
        else
            flash.now[:notice] = "hello"
            puts @post.errors.inspect
            render :new , status: :bad_request
        end  
    end

    def show
         @post = Post.find(params[:id])
    end

    def my_post

        if session[:user_id] == 1 # user no 1 is admin
        @posts = Post.joins(:category).order(:id).paginate(page: params[:page], per_page: 10)
        else
        @posts = Post.joins(:category).where(user_id: session[:user_id] ).order(:id).paginate(page: params[:page], per_page: 10)
        end

    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])  
        if  @post.update(post_params)
          redirect_to :my_post
        else
            puts @post.errors.inspect
          render 'edit' , status: :unprocessable_entity
        end
      end


    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to :my_post
    end


    def search
        @search = params[:search]
        @name = @search["name"]
        @posts = Post.where(["title LIKE ?", "%" + @name +"%"]).paginate(page: params[:page], per_page: 3)
        render :index
    end

    def category
        catId = params[:id]
        @posts = Post.where(category_id: catId).paginate(page: params[:page], per_page: 3)
        render :index
    end

    private
    def post_params
        params.require(:post).permit(:id ,:title,:content, :author , :image , :category_id)
    end

end
