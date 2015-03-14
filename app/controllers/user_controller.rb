class UserController < ApplicationController

  include UserHelper, LocaleProvider

  before_action :set_locale

  def create
    generate_errors(params[:user])
    if @errors.empty?
      user = User.new(:email => params[:user][:email], password: params[:user][:password],
        :first_name => params[:user][:firstName], :last_name => params[:user][:lastName])
      @errors.push(t(:occupied_email)) if !user.save
    end
    sign_in(:user, User.find(user)) if @errors.empty?
    respond_to do |format|
      format.html { redirect_to user_path}
      format.js   {}
    end
  end

  def login
    user = User.find_by_email(params[:user][:email])
    if !user.nil? and user.valid_password?(params[:user][:password])
      sign_in(:user, user)
    else
      @error = t(:login_fail)
    end
    respond_to do |format|
      format.html { redirect_to login_path}
      format.js   {}
    end
  end

  def reset_password

    user = User.where(:email => params[:user][:email]).first
    @error = user.nil? ? t(:no_such_user): ""
    user.send_reset_password_instructions if @error.blank?
    respond_to do |format|
      format.html { redirect_to reset_password_path}
      format.js   {}
    end
  end

end
