class User < ApplicationRecord
  belongs_to :team
  has_many :purchases

  scope :active, -> { where(active: true) }
  scope :purchase_order, -> {
    order(<<-SQL)
      (
        SELECT created_at FROM purchases
          WHERE users.id = user_id
          ORDER BY created_at DESC
          LIMIT 1
      ) ASC NULLS FIRST,
      created_at ASC
    SQL
  }
end
