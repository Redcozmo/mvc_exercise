# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id                  :bigint(8)        not null, primary key
#  name                :string           not null
#  discount_percentage :integer          default(0)
#  has_discount        :boolean          default(FALSE)
#  name                :string
#  original_price      :float            not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

FactoryBot.define do
  factory :item do
    original_price      { Faker::Number.decimal(2) }
    has_discount        { Faker::Boolean.boolean }

    trait :with_discount do
      has_discount { true }
      discount_percentage { rand(9) * 10 }
    end

    trait :without_discount do
      has_discount { false }
      discount_percentage { 0 }
    end

    factory :item_with_discount, traits: %i[with_discount]
    factory :item_without_discount, traits: %i[without_discount]
  end
end
