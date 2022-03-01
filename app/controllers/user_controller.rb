class UserController < ApplicationController

    def home 
        @posts =Post.all
    end
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
        session[:user_id] = @user.id
        redirect_to my_post_path
        else
        render 'new'
        end
    end
    
    def login
   
    end

    def loginsubmit
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
          session[:user_id] = user.id
          flash[:notice] = "Logged in successfully"
          redirect_to root_path
        else
          flash.now[:alert] = "There was something wrong with your login details"
          render 'login'
        end
      end


      def logout
        session[:user_id] = nil
        #flash[:notice] = "Logged out"
        redirect_to root_path
      end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :phone)
      end

end
