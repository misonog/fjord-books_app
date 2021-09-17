# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    # 以下を参考に N+1 問題を回避
    # https://edgeapi.rubyonrails.org/classes/ActiveStorage/Attached/Model.html#method-i-has_one_attached
    @users = User.with_attached_icon.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end
end
