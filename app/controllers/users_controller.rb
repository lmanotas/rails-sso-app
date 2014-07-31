class UsersController < ApplicationController

  doorkeeper_for :me

  def me
    render :json => current_resource_owner
  end

end