# frozen_string_literal: true

class Product < ApplicationRecord
  enum :category => {
    'health'          => 0,
    'sleep'           => 1,
    'food'            => 2,
    'home'            => 3,
    'fitness'         => 4,
    'mind'            => 5,
    'skin_and_beauty' => 6,
  }, :_prefix => :category

  enum :product_type => {
    'supplements'               => 0,
    'sleep'                     => 1,
    'keto'                      => 2,
    'cleaning_supplies'         => 3,
    'nootropics'                => 4,
    'personal_care_and_hygiene' => 5,
  }, :_prefix => :product_type

  enum :demographic => {
    'women'        => 0,
    'millenial'    => 1,
    'fitness'      => 2,
    'home'         => 3,
    'productivity' => 4,
  }, :_prefix => :demographic

  validates :name,         :presence => true
  validates :category,     :presence => true
  validates :product_type, :presence => true
  validates :link,         :presence => true, :uniqueness => true
  validates :price,        :presence => true
  validates :demographic,  :presence => true
  validates :shipping,     :presence => true

  belongs_to :company

  class << self
    def with_free_shipping
      includes(:company).where(:shipping => 0)
    end
  end
end
