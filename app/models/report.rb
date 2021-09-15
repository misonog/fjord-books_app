# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  def created_by?(target_user)
    user == target_user
  end

  def created_on
    created_at.to_date
  end
end
