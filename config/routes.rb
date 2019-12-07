# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/products', :to => 'product#all_products'
  get '/products/free_shipping', :to => 'product#products_with_free_shipping'
  get '/product/:name', :to => 'product#find_product_by_name'
  get '/products/:category', :to => 'product#products_by_category'
  get '/products_cheapest_by_type', :to => 'product#cheapest_by_type'
  get '/products_by_expensiveness', :to => 'product#products_ordered_by_price'
  get '/company_by_cheapest_product', :to => 'company#ordered_by_cheapest_product'
  get '/products/type/:type', :to => 'product#products_by_type'
end
