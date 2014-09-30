require 'rails_helper'

RSpec.describe ApplicationController, :type => :controller do
	controller SessionsController do
		# def new
		# 	redirect_to log_in_url
		# end
	end

	it "redirect to the login page" do
		get :new
		expect(response).to render_template("/log_in")
	end
end
