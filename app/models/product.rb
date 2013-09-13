class Product < ActiveRecord::Base
  has_many :orders, :through => :line_items
has_many :line_items
  attr_accessible  :description, :image_url, :title, :price
validates_numericality_of :price 
validate :price
validates_uniqueness_of :title
validates_format_of :image_url,
                    :with => %r{\.(gif|jpeg|png)$}i,
                    :message => 'must be a URL for GIF, JPEG' +
                                'or PNG image.'
protected
def Price_must_be_at_least_a_cent
errors.add(:price, 'should be at least 0.01') if price.nil? || price< 0.01
end
def self.find_products_for_Sale
find(:all, :order => "title")
end


end