class UsersController < ApplicationController
  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.json
    end
  end
end
