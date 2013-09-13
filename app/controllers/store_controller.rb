class StoreController < ApplicationController
  
# GET /stores
  # GET /stores.json

before_filter :find_cart, :except => :empty_cart
  
def index
  @products = Product.all
  @cart = find_cart

respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stores }
    end

end

# POST /stores
  # POST /stores.json
  
def add_to_cart   
@cart = find_cart        
product = Product.find(params[:id])
 @current_item = @cart.add_product(product)     
rescue ActiveRecord::RecordNotFound
    logger.error("Attempt to access invalid product #{params[:id]}")
    flash[:notice] = "invalid product"
    redirect_to :action => 'index'
  end

def empty_cart
 session[:cart] = nil
redirect_to_index("Ur cart is empty")
end

def checkout
@cart = find_cart
if @cart.items.empty?
redirect_to_index("Your cart is empty")
else
@order = Order.new
end
end

def save_order
@cart = find_cart
@order = Order.new(params[:order])
@order.add_line_items_from_cart(@cart)
if @order.save
session[:cart] = nil
redirect_to_bill("Thank U for your order")
else
render :action => 'checkout'
end
end

private
 
def find_cart
  @cart = (session[:cart] ||= Cart.new)
  end

def redirect_to_index(msg)
flash[:notice] = msg
redirect_to :action => 'index'
end

protected
 
 def authorize
end

end