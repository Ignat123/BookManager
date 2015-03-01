module UserHelper

  def generate_errors(userParams)
    @errors = []
    @errors.push(t(:enter_name)) if userParams[:firstName].blank?
    @errors.push(t(:enter_last_name)) if userParams[:lastName].blank?
    @errors.push(t(:enter_email)) if userParams[:email].blank?
    @errors.push(t(:enter_password)) if userParams[:password].blank?
    @errors.push(t(:enter_confirm_password)) if userParams[:password_confirmation].blank?
    @errors.push(t(:confirmation_fail)) if userParams[:password_confirmation] != userParams[:password]
  end

end
