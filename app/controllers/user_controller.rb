class UserController < ActionController::Base

  include UserHelper

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

end
