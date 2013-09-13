class CreateCartitems < ActiveRecord::Migration
  def self.up
    create_table :cartitems do |t|
      t.string :product
      t.integer :quantity

      t.timestamps
    end
  end
def self.down
drop_table :caritems
end
end
