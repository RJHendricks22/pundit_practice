class StaticPagesController < ApplicationController
  def root
    if user_signed_in?
      @user = current_user
    else
      redirect_to "/users/sign_in"
    end
  end

end
