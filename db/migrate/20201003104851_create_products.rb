class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string  :name,          null: false
      t.text    :details,       null: false
      t.integer :category_id,   null: false
      t.integer :status_id,     null: false
      t.integer :fee_id,        null: false
      t.integer :consider_id,   null: false
      t.integer :days_id,       null: false
      t.integer :price,         null: false
      t.integer :user_id,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
