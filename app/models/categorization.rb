# frozen_string_literal: true
# == Schema Information
#
# Table name: categorizations
#
#  id          :bigint(8)        not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  item_id     :integer
#
# Indexes
#
#  index_categorizations_on_item_id_and_category_id  (item_id,category_id)
#

class Categorization < ApplicationRecord
  belongs_to :item
  belongs_to :category
end
