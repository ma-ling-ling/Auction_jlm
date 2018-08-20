class AddDescriptionandtitleToAuction < ActiveRecord::Migration[5.2]
  def change
    add_column :auctions, :title, :string
    add_column :auctions, :description, :string
  end
end
