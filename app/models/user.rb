class User < ApplicationRecord
  belongs_to :team
  has_many :purchases

  scope :purchase_order, -> {
    order(<<-SQL)
      (
        SELECT created_at FROM purchases
          WHERE users.id = user_id
          ORDER BY created_at DESC
          LIMIT 1
      ) DESC,
      created_at DESC
    SQL
  }
end
