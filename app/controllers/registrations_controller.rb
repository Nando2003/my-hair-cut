class RegistrationsController < ApplicationController
  def new
    render inertia: 'Auth/Register'
  end

  def create
    user = User.new(user_params)

    if user.save
      start_new_session_for user
      redirect_to after_authentication_url
    else
      redirect_to new_registration_path, inertia: { errors: user.errors.to_hash }
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email_address,
      :password,
      :password_confirmation
    )
  end
end
