class LineItems < ActiveRecord::Base
  belongs_to :Product
  belongs_to :Order
  # attr_accessible :title, :body
validates :order_id, :product_id, :presence => true

def self.from_cart_item(cart_item)
li = self.new
li.product = cart_item.product
li.quantity = cart_item.quantity
li.total_price = cart_item.price

end

end
