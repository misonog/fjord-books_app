# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def following
    @user = User.find(params[:id])
    @following = @user.following.order(:id).page(params[:page])
    render 'index_following'
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.order(:id).page(params[:page])
    render 'index_follow'
  end
end
