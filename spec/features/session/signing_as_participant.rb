require 'rails_helper'

RSpec.feature "Signing teacher" do
  before do 
    visit signin_path
  end

  scenario "with success view page" do
    expect(page).to have_content("Please Choose a Login Method") 
  end

  scenario "with valid attribute" do
    participant = FactoryGirl.create(:participant)
    fill_in "code", with: participant.code

    click_button "Signin"

    expect(page).to have_content("Welcome!")
  end

  scenario "invalid attribut" do
    user = FactoryGirl.create(:user)
    fill_in "email", with: user.email
    fill_in "password", with: "blah"

    click_button "Signin Teacher"

    expect(page).to have_content("Please Choose a Login Method") 
  end
end
