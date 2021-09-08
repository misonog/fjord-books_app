# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  # GET /users
  def index
    @users = User.order(:id).page(params[:page])
  end

  # GET /books/1
  def show
  end
end
