class RegistrationsController < Devise::RegistrationsController
<<<<<<< HEAD
  private

    def sign_up_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

    def account_update_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
=======

private

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

>>>>>>> add_username
end
