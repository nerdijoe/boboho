require 'rails_helper'

RSpec.feature "Listing", :type => :feature do

  let(:user) {FactoryGirl.create(:user)}
  let(:category) {FactoryGirl.create(:category)}
  let(:subcategory) {FactoryGirl.create(:subcategory)}
  let(:listing) {FactoryGirl.create(:listing)}

  before do
    visit root_path
  end

  context "click on the listing"



end
