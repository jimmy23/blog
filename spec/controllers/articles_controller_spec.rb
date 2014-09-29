require "rails_helper"

RSpec.describe ArticlesController, :type => :controller do
	describe "get :index" do
		it "should responds success" do 
			get :index
			expect(response).to be_success
		end

		it "should loads all of articles into @articles" do 
			a1, a2 = Article.create(title: "t1", content: "c1"), Article.create(title: "t2", content: "c2")
			get :index

			expect(assigns(:articles)).to match_array([a1,a2])
		end
	end

	describe "get :new" do
		it "should admin access, other is not" do 
			
		end
	end		
end