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

class Item < ApplicationRecord
  validates :original_price, presence: true,
                             numericality: { greater_than: 0,
                                             message: "value need to be greater than 0" }

  validates :has_discount, presence: true,
                           inclusion: { in: %w(true false),
                                        message: "%{value} is not a boolean" }

  validates :discount_percentage, presence: true,
                                  numericality: { greater_than: 0,
                                                  less_than: 100,
                                                  message: "value need to be in the range 0-100" }

  def price
    if has_discount
      ( original_price * ( 1 - discount_percentage.to_f / 100 ) ).round(2)
    else
      original_price
    end
  end

  def self.average_price
    tot = 0.to_f
    all.find_each do |item|
      tot += item.original_price
    end
    (tot / count ).round(2)
  end
end
