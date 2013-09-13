class AddTestData < ActiveRecord::Migration
  def self.up
   Product.delete_all
   Product.create(:title => 'pragmatic',
 :description => 'foundational piece of project',
:image_url => '/images/svn.jpg',
:price => 28.50)

  end

  def self.down
    Product.delete_all
  end
end
