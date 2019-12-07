# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

products = [
  ["Essential Vitamins for Women", 'Ritual', 0, 0, 'https://ritual.com/products/essential-for-women-multivitamin', 30.00, 0, 0, nil],
  ["Casper Pillow", 'Casper', 1, 1, 'https://casper.com/pillows/', 65.00, 1, 15.00, nil],
  ["Purple Pillow", 'Purple', 1, 1, 'https://purple.com/pillows/purple-pillow', 99.00, 1, 10.00, nil],
  ["Tuft and Need Mattress", 'Tuft and Needle', 1, 1, 'https://www.tuftandneedle.com/mattress/original/', 500.00, 1, 3.00, nil],
  ["Keto Cups", 'Evolved', 2, 2, 'https://eatingevolved.com/products/original-keto-cups', 10.00, 2, 0, 35],
  ["Ghee", 'Fourth and Heart', 2, 2, 'https://fourthandheart.com/product/original-ghee/', 13.00, 2, 10.00, nil],
  ["Cleaning spray", 'Trumans', 3, 3, 'https://www.trumans.com', 18.00, 3, 1.00, nil],
  ["High School Genes", 'Goop', 0, 0, 'https://shop.goop.com/shop/products/high-school-genes', 90.00, 2, 0, 20],
  ["Light Alarm Clock", 'Phillips', 3, 1, 'https://www.amazon.com/gp/product/B0093162RM?ie=UTF8&tag=tzr-15862306-20&camp=1789&linkCode=xm2&creativeASIN=B0093162RM', 100.00, 1, 0, nil],
  ["Ketosis Urine Strips", 'Perfect Keto', 4, 2, 'https://www.amazon.com/gp/product/B01MUB7BUV?ie=UTF8&tag=tzr-15862306-20&camp=1789&linkCode=xm2&creativeASIN=B01MUB7BUV', 8.00, 2, 0, 30.00],
  ["Melatonin Gummies", 'Olly', 1, 0, 'https://www.amazon.com/gp/product/B0145QI7O0?ie=UTF8&tag=tzr-15862306-20&camp=1789&linkCode=xm2&creativeASIN=B0145QI7O0', 13.00, 2, 0, 50.00],
  ["Hair supplment gummies", 'SugarBearHair', 6, 0, 'https://www.amazon.com/SugarBearHair-Vitamins-1-Month-Supply/dp/B019ZZB3O2/ref=as_li_ss_tl?th=1&linkCode=ll1&tag=tzr-15862306-20&linkId=b243ad059c37a4f2f3503e5e97608206&language=en_US', 30, 2, 0, nil],
  ["Mushroom Coffee", 'Four sigmatic', 5, 4, 'https://www.amazon.com/gp/product/B00ZWA7LQ4?ie=UTF8&tag=tzr-16823336-20&camp=1789&linkCode=xm2&creativeASIN=B00ZWA7LQ4', 12.00, 4, 0, nil],
  ["Charcoal Toothpaste", 'Cali White', 6, 5, 'https://www.amazon.com/gp/product/B06WRS71N8?ie=UTF8&tag=tzr-15862306-20&camp=1789&linkCode=xm2&creativeASIN=B06WRS71N8', 10.00, 1, 15.00, nil]
]

products.each do |product|
  company = Company.find_or_create_by(
    :name => product[1]
  )

  Product.create(
    :name               => product[0],
    :company            => company,
    :category           => product[2],
    :product_type       => product[3],
    :link               => product[4],
    :price              => product[5],
    :demographic        => product[6],
    :shipping           => product[7],
    :shipping_threshold => product[8],
  )
end
