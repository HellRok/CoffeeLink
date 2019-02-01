class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.integer :weight, null: false
      t.integer :price_cents, null: false
      t.references :user, foreign_key: true
      t.references :bean, foreign_key: true

      t.timestamps
    end
  end
end
