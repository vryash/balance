class UsersController < ApplicationController

  def index
    # TODO: pagination
    render json: UserSerializer.new(User.all).serializable_hash
  end

  def create
    user = User.new(name: params[:name], balance: 0)
    user.save!
  end
end
