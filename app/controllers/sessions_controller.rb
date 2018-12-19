# frozen_string_literal: true

class SessionsController < ApplicationController

  # create user sessions(authenticate user)
  def create
    @user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
    session[:user_id] = @user.id
    redirect_to home_path
  end

  # logout user
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def new; end
end
