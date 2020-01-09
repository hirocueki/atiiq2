class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item

  scope :older, -> { order(created_at: :asc) }

end
