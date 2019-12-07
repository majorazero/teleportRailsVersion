# frozen_string_literal: true

class Company < ApplicationRecord
  validates :name, :presence => true, :uniqueness => true

  has_many :products
end
