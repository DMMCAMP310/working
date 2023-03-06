class ChangePriceCurrencyToShoppingCartItems < ActiveRecord::Migration[5.2]
  def up
    change_column :shopping_cart_items, :price_currency, :string, default: "JPY", null: false
  end

  def down
    change_column :shopping_cart_items, :price_currency, :string, default: "USD", null: false
  end
end
