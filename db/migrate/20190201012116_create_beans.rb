class CreateBeans < ActiveRecord::Migration[6.0]
  def change
    create_table :beans do |t|
      t.string :name, null: false
      t.string :location
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
