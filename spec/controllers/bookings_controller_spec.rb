require 'rails_helper'

RSpec.describe BookingsController, type: :controller do

  describe "GET #show_review" do
    it "returns http success" do
      get :show_review
      expect(response).to have_http_status(:success)
    end
  end

end
