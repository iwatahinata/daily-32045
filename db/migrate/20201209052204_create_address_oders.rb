class CreateAddressOders < ActiveRecord::Migration[6.0]
  def change
    create_table :address_oders do |t|

      t.timestamps
    end
  end
end
