require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do

  describe "GET #withdraw" do
    it "returns http success" do
      get :withdraw
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #transfer" do
    it "returns http success" do
      get :transfer
      expect(response).to have_http_status(:success)
    end
  end

end
