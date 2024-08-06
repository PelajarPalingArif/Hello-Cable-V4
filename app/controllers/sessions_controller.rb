class SessionsController < ApplicationController
  
  def new
    if logged_in? 
      redirect_to rooms_path
    end
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      Rails.logger.info("Logged In, User #{user.id}");
      redirect_to rooms_path
    else
      Rails.logger.info("Wrong Email or Password");
    end
  end

  def destroy
    session[:user_id] = nil
    Rails.logger.info("Logged Out Successfully")
    if !current_user.present?
      Rails.logger.info("There is no current_user")
      redirect_to login_path
    end
  end

  private 

  def session_params
    params.require(:session).permit(:email, :password)
  end

end
