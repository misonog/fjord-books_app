# frozen_string_literal: true

class Users::FollowingController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @following = @user.following.with_attached_avatar.order(:id).page(params[:page])
  end
end
