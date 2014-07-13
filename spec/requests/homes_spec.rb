require 'rails_helper'

RSpec.describe "Homes", :type => :request do
  describe "GET /" do
    it "works! (now write some real specs)" do
      visit root_path
      expect(page).to have_content("Sign up")
    end
  end
end
