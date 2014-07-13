require 'rails_helper'
require 'spec_helper'

RSpec.describe "Galleries" do

  describe "Gallery" do
    before :each do
      user = create(:user)
      visit new_session_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password_digest
      click_button "Sign in"
    end

    describe "When Signed In" do
      it "Should have a new gallery link" do
        visit root_path
        expect(page).to have_link("New Gallery")
      end
    end
  end
end
