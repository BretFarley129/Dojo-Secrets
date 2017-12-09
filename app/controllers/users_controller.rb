class UsersController < ApplicationController
  def new
  end
  
  def create
    puts params['Name']
    puts params['Email']
    puts params['Password']
    puts params['Password_Confirmation']
    @user = User.new(name: params['Name'], email: params['Email'], password: params['Password'], password_confirmation: params['Password_Confirmation'])
    if @user.valid?
      @user.save
      redirect_to '/sessions/new'
    else
      flash[:errors] = ["can't be blank"]
      redirect_to :back
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  private
  def user_params
  end

end
