require 'rails_helper'

RSpec.feature "Signing teacher" do
  # let(:user) { FactoryGirl.create(:user}
  before do 
    visit signin_path
  end

  scenario "with success view page" do
    expect(page).to have_content("Please Choose a Login Method") #waits for the sign in page to load
  end

  scenario "with valid attribute" do
    user = FactoryGirl.create(:user)
    fill_in "email", with: user.email
    fill_in "password", with: user.password

    click_button "Signin Teacher"

    expect(page).to have_content("Welcome Teacher!")
    expect(page).to have_content "Dashboard"
  end

  scenario "invalid attribut" do
    user = FactoryGirl.create(:user)
    fill_in "email", with: user.email
    fill_in "password", with: "blah"

    click_button "Signin Teacher"

    expect(page).to have_content "Invalid email or password"
  end
end
