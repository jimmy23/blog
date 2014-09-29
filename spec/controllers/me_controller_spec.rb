require "rails_helper"

describe MeController, :type => :controller do
	describe "GET #index" do
		it "should responds 200 status code " do
			get :index
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "should renders index template" do
			get :index
			expect(response).to render_template("index")

		end

	end
end