class Bean < ApplicationRecord
  belongs_to :team

  has_many :purchases
end
