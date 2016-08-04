class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    user = User.from_omniauth(request.env["omniauth.auth"])

    # If the validations fail and the user was not created successfully. If the user was created successfully and persisted within the database, the sign in process will be completed by using the devise method 'sign_in_and_redirect'. Else, if the user was not saved successfully we will redirect them to the sign up page".

    if user.persisted?
      sign_in_and_redirect user, notice: "Signed in!"
    else
      session["devise.user_attributes"] = user.attributes # This will persist the users attributes when validations fail.
      redirect_to new_user_registration_path
    end
  end
end
