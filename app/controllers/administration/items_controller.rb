# frozen_string_literal: true

module Administration
  class ItemsController < AdministrationController
    before_action :set_post, only: [:update]

    def index
      @emails = User.emails_of_all_users
      @items = Item.all
    end

    def update
      if params[:item][:discount_percentage] > 0.to_s
        @item.update(has_discount: true, discount_percentage: params[:item][:discount_percentage])
        redirect_to administration_items_path, success: "Update price successfully"
      else
        @item.update(has_discount: false, discount_percentage: params[:item][:discount_percentage])
        redirect_to administration_items_path
      end
    end

    private

    def set_post
      @item = Item.find(params[:id])
    end
  end
end
