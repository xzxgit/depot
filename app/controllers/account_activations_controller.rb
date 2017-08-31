class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    puts params
    3.times { puts"aaa" }
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activated
      log_in user
      #user.update_attribute(:activated, true)
      #user.update_attribute(:activated_at, Time.zone.now)
      flash[:success] = "Account activated!"
      redirect_to user
      
    else
      flash[:danger] = "Invalid activation line"
      redirect_to root_path
    end
  end
end
