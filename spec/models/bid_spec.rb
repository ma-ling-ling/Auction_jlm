require 'rails_helper'

RSpec.describe Bid, type: :model do


  it 'belongs to bidder' do
  	expect(Bid.reflect_on_association(:bidder).macro).to eq(:belongs_to)
  end

  it 'belongs to auction' do
  	expect(Bid.reflect_on_association(:auction).macro).to eq(:belongs_to)
  end

  it "is not valid without a bidder" do
  	bid = Bid.new(bidder: nil)
  	expect(bid).to_not be_valid      #this test passes without adding into bid.rb -->  validates_presence_of :bidder 
  end 


end



RSpec.describe BiddingEngine do
  describe ".bid!" do
    let(:seller) { User.create(:email => 'jane@doe.com', :password => 'pw1234') }
    let(:bidder) { User.create(:email => 'john@doe.com', :password => 'pw1234') }
    let(:auction) { Auction.create(title: 'Anything', description: 'Lorem ipsum', start_date: DateTime.now, end_date: DateTime.now + 1.week, seller_id: seller.id) }

    it "creates a new bid on an auction" do
      described_class.bid!(auction, 100, bidder)
      expect(auction.errors).to be_empty
    end

    it "will give an error if the second bid is smaller than the first" do
      described_class.bid!(auction, 100, bidder)
      described_class.bid!(auction, 90, bidder)
      expect(auction.errors[:bid].first).to eq "must be bigger than the last bid on the auction"
  	end

   it 'cannot create a bid if it is an equal amount as the last bid' do
      described_class.bid!(auction, 100, bidder)
      described_class.bid!(auction, 100, bidder)
      expect(auction.errors[:bid].first).to eq "must be bigger than the last bid on the auction"
    end

  end
end