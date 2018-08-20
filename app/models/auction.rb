class Auction < ApplicationRecord
	# validates :title, presence: true
	# validates :description, presence: true
	# validates :start_date, presence: true
	# validates :end_date, presence: true
	validates_presence_of :title, :description, :start_date, :end_date 

	has_one :buyer, :class_name => "User", :foreign_key => "buyer_id"

	has_one :seller, :class_name => "User", :foreign_key => "seller_id"

	has_many :bids
end
