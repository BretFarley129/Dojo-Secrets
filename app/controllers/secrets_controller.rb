class SecretsController < ApplicationController
  def index
    @secrets = Secret.all
  end

  def create
    @user = current_user
    @secret = Secret.new(user: @user, content: params['Content'])
    if @secret.valid?
      @secret.save
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = ['Please enter a valid secret']
      redirect_to :back
    end
  end
  
  def delete
    @user = current_user
    secret = Secret.find(params[:id])
    secret.destroy
    redirect_to  "/users/#{@user.id}"
  end
end
