require 'rails_helper'

describe "user login" do
  it "redirects user to index" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Login"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Sign In"
    current_path.should eq(root_path)
    expect(page).to have_content('Profile')
  end
end
