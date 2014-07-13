require 'rails_helper'

RSpec.describe "Groups", :type => :request do
  describe "GET /groups" do
    before do
      visit groups_path
    end
    it "should display Groups" do
      expect(page).to have_content("Groups")
    end
    it "should have a sign in link" do
      expect(page).to have_content("Sign in")
    end
  end
end
