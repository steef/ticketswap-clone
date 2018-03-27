class UsersController < ApplicationController
  def profile
    @user = current_user
    authorize @user
  end
end
