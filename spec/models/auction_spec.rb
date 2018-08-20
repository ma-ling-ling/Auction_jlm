require 'rails_helper'

RSpec.describe Auction, type: :model do

  subject {                    #the "subject" method is part of the rspec testing framework
  	described_class.new(title: "Anything", description: "Lorem ipsum", start_date: DateTime.now, end_date: DateTime.now + 1.week)
  }    

  it "is valid with valid attributes" do
 # 	expect(Auction.new(title: 'Anything')).to be_valid 
 	expect(subject).to be_valid
  end

  it "is not valid without a title" do
  	# auction = Auction.new(title: nil)
  	# expect(auction).to_not be_valid 

  	subject.title = nil
  	expect(subject).to_not be_valid
  end

  it "is not valid without a description" do
  	subject.description = nil
  	expect(subject).to_not be_valid
  end

  it "is not valid without a start_date" do
  	subject.start_date = nil 
  	expect(subject).to_not be_valid
  end

  it "is not valid without a end_date" do
  	subject.end_date = nil 
  	expect(subject).to_not be_valid 
  end 

  it 'has one buyer' do
  	expect(Auction.reflect_on_association(:buyer).macro).to eq(:has_one)
  end

  it 'has one seller' do
  	expect(Auction.reflect_on_association(:seller).macro).to eq(:has_one)
  end


  it 'has many bids' do
  	expect(Auction.reflect_on_association(:bids).macro).to eq(:has_many)
  end


end

