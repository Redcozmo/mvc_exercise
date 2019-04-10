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

require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'Model instantiation' do
    subject(:new_item) { described_class.new }

    describe 'Database' do
      it { is_expected.to have_db_column(:id).of_type(:integer) }
      it { is_expected.to have_db_column(:original_price).of_type(:float).with_options(null: false) }
      it { is_expected.to have_db_column(:has_discount).of_type(:boolean).with_options(default: false) }
      it { is_expected.to have_db_column(:discount_percentage).of_type(:integer).with_options(default: 0) }
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    end
  end

  describe 'Validation' do
    it { is_expected.to validate_presence_of(:original_price) }
    it { is_expected.to validate_presence_of(:discount_percentage) }
  end

  describe 'Price' do
    context 'when the item has a 20% discount' do
      let(:item) { build(:item_with_discount, original_price: 100.00, discount_percentage: 20) }

      it { expect(item.price).to eq(80.00) }
    end

    context 'when the item has a 5% discount' do
      let(:item) { build(:item_with_discount, original_price: 100.00, discount_percentage: 5) }

      it { expect(item.price).to eq(95.00) }
    end

    context 'when the item has no discount' do
      let(:item) { build(:item_with_discount, original_price: 100.00, discount_percentage: 0) }

      it { expect(item.price).to eq(100.00) }
    end
  end
end
