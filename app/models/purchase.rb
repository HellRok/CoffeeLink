class Purchase < ApplicationRecord
  belongs_to :bean
  belongs_to :user

  scope :bought_order, -> { order(created_at: :desc) }
end
