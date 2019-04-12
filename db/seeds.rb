# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id                  :bigint(8)        not null, primary key
#  original_price      :float            not null
#  has_discount        :boolean          default(FALSE)
#  discount_percentage :integer          default(0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

p "Seeding items........."
1.upto(10) do |i|
  item = Item.create!(
    original_price: Faker::Number.decimal(2),
    has_discount: Faker::Boolean.boolean,
    name: Faker::Commerce.product_name
  )

  if item.has_discount
    item.discount_percentage = rand(1..9) * 10
    item.save
  end

  p "ITEM #{i} : créé"
end

p "Seeding categories........."
1.upto(10) do |i|
  Category.create!(
    name: Faker::Commerce.material,
    description: Faker::Commerce.color
  )

  p "CATEGORY #{i} : créée"
end

p "Seeding one admin........."
Admin.create(
  email: 'superadmin@proton.fr',
  password: 'superpassword',
  password_confirmation: 'superpassword',
)
p "ADMIN #{Admin.first.email} : créé"
