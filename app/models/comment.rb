class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item

  scope :recent, -> { order(created_at: :desc) }

end
