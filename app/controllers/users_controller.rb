class UsersController < ApplicationController
	def index
    @users = User.all
    @book = Book.new
    @user = current_user
    end
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new

    # @books = Book.all
 end
 
 def new
    @user = User.new
    # @user.image = "default_icon.jpg"
    @user.save
    redirect_to user_path(@user.id)
 end

  
 def edit
    @user = User.find(params[:id])
    @user.save
    
 end

def update
	@user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(current_user.id)
    flash[:notice] ='You have updated user successfully.'
else
    render :edit
end
end
 private
 def user_params
  params.require(:user).permit(:name, :password, :password_confirmation, :profile_image,:introduction)
end
end
