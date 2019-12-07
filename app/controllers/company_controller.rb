# frozen_string_literal: true

class CompanyController < ApplicationController
  protect_from_forgery with: :null_session

  def ordered_by_cheapest_product
    companies = []

    Company.includes(:products).find_each do |company|
      hash = {
        :company => company.name,
        :price   => company.products.order(:price => :asc).first.price
      }

      companies.push hash
    end

    result = companies.sort_by { |item| item[:price] }

    render json: {
      :companies => result
    }
  end
end
