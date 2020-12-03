class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.references  :cart,  foreign_key: true
      t.references  :food,  foreign_key: true
      t.integer     :quantity, default: 0, null: false
      t.timestamps
    end
  end
end
