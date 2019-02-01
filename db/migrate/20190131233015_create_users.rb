class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :slack_id, null: false
      t.string :name, null: false
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
