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

1.upto(10) do |i|
  item = Item.create!(
    original_price: Faker::Number.decimal(2),
    has_discount: Faker::Boolean.boolean
  )

  if item.has_discount
    item.discount_percentage = rand(1..9) * 10
    item.save
  end

  p "ITEM #{i} : créé"
end
