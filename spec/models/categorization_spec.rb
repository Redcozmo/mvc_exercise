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

require 'rails_helper'

RSpec.describe Categorization, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
