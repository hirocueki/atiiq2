class Item < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, :content, presence: true


  scope :recent, -> { order(updated_at: :desc) }

end
