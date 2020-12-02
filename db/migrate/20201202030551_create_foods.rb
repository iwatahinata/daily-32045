class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string     :title, null: false
      t.integer    :price, null: false
      t.references :user,  foreign_key: true
      t.timestamps
    end
  end
end
