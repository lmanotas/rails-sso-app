class UsersController < ApplicationController

  doorkeeper_for :profile

  def profile
    render :json => current_resource_owner
  end

end