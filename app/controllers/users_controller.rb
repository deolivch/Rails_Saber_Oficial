class UsersController < ApplicationController
  def index
      @users = User.all
  end
  
  def show
      @user = User.find(params[:id])
  end

  def new
  		@user = User.new
  end
  
  def create
  		@user = User.new(user_params)
  		if @user.save
  				redirect_to @user, notice: "Usuário foi criado com sucesso!"
  				#tire o método quando criar o Helper
  				#Usuário depois de se cadastrar acessar ao sistema automaticamente
  		#sign_in
  		else
  			render action: :new
  		end
  end
  private

  def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
