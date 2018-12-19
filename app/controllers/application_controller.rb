# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  # return to login screen if user is not logged in
  def authenticate
    redirect_to :login unless user_signed_in?
  end

  # returns current logged in user from session if present
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # return true if a user is signed in
  def user_signed_in?
    !!current_user
  end
end
