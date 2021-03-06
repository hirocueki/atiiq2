class Item < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :stocks, dependent: :destroy
  has_many :stocker_users, through: :stocks, source: :user
  validates :title, :content, presence: true

  acts_as_ordered_taggable

  scope :recent, -> { order(updated_at: :desc) }

  scope :newer, -> { order(created_at: :desc) }

  def stock_user(user_id)
    stocks.find_by(user_id: user_id)
  end
end
