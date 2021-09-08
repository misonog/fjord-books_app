# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_ZIP_CODE_REGEX = /\A\d{7}\z/
  validates :zip_code, format: { with: VALID_ZIP_CODE_REGEX }, allow_nil: true
end
