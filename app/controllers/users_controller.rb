class UsersController < ApplicationController

  doorkeeper_for :me
  before_action :authenticate_user!

  def me
    render :json => current_resource_owner
  end

end