# frozen_string_literal: true

class ProductController < ApplicationController
  protect_from_forgery with: :null_session

  def all_products
    products = []
    Product.includes(:company).find_each() do |product|
      hash = dummy_serialize_for product

      products.push hash
    end

    render json: {
      :products => products
    }
  end

  def products_with_free_shipping
    products = []
    Product.with_free_shipping.find_each() do |product|
      hash = dummy_serialize_for product

      products.push hash
    end

    render json: {
      :products => products
    }
  end

  def products_by_category
    products = []
    Product.where(
      :category => params[:category].downcase
    ).find_each do |product|
      hash = dummy_serialize_for product

      products.push hash
    end

    render json: {
      :products => products
    }
  end

  def cheapest_by_type
    hash = {}
    Product.product_types.keys.each do |type|
      product = Product
        .includes(:company)
        .where(:product_type => type)
        .order(:price => :asc).first
      hash[type] = dummy_serialize_for product
    end

    render json: { :result => hash }
  end

  def products_by_type
    products = []
    Product.where(
      :category => params[:type].downcase
    ).find_each do |product|
      hash = dummy_serialize_for product

      products.push hash
    end

    render json: {
      :products => products
    }
  end

  def products_ordered_by_price
    products = []
    Product.order(:price => :desc).each() do |product|
      pp product
      hash = dummy_serialize_for product

      products.push hash
    end

    render json: {
      :products => products
    }
  end

  def find_product_by_name
    # on second thought, i probably should of downcased all the names in
    # the database so the name searching component is more robust
    product = Product.find_by(:name => params[:name])

    render json: { :product => product }
  end

  def dummy_serialize_for(product)
    {
      :name               => product.name,
      :company            => product.company.name,
      :category           => product.category,
      :product_type       => product.product_type,
      :link               => product.link,
      :price              => product.price,
      :demographic        => product.demographic,
      :shipping           => product.shipping,
      :shipping_threshold => product.shipping_threshold
    }
  end
end
