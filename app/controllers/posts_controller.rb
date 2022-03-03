class PostsController < ApplicationController
    before_action :require_user, except: [:show, :index ]
    def index 
        @posts = Post.all
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
        @posts = Post.joins(:category).where(user_id: session[:user_id] ).order(:id)
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

    private
    def post_params
        params.require(:post).permit(:id ,:title,:content, :author , :image , :category_id)
    end

end
