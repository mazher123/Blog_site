class UsersController < ApplicationController

    def home 
        @posts =Post.all
    end
    
    def new
        @users = User.new
    end

    def create
  
        @users = User.new(user_params)
        @users.role = 1
        # role 1 for normal user
        if @users.save
        session[:user_id] = @users.id
        redirect_to my_post_path
        else
        render 'new' ,status: :bad_request
        end
    end
    
    def login
      @users = User.new
    end

    def loginsubmit
        @users = User.find_by(email: params[:users][:email].downcase)

        if @users && @users.authenticate(params[:users][:password])
          session[:user_id] = @users.id
          flash[:notice] = "Logged in successfully"
          redirect_to root_path
        else
          flash[:notice] = "Login Unsuccessful"
          render  :login , status: :bad_request
        end
      end


      def logout
        session[:user_id] = nil
        #flash[:notice] = "Logged out"
        redirect_to root_path
      end

    private
    def user_params
        params.require(:user).permit(:id ,:name, :email, :password, :phone)
      end

end
