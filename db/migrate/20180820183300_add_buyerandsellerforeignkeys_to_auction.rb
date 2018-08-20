class AddBuyerandsellerforeignkeysToAuction < ActiveRecord::Migration[5.2]
  def change
    add_column :auctions, :buyer_id, :integer
    add_column :auctions, :seller_id, :integer
  end
end
