require "rails_helper"

RSpec.describe Article, :type => :model do 
	it "should title and content is not null, valid" do
		a1 = Article.new(content: "balabala...").save
		a2 = Article.new(title: "We are ...").save
		a3 = Article.new.save
		a4 = Article.create(title: "title1", content: "content1")
		a5 = Article.create(title: "title2", content: "content2")

		expect(a1).not_to be_truthy
		expect(a2).not_to be_truthy
		expect(a3).not_to be_truthy

		expect(Article.count).to eq(2)
		expect(Article.find_by_title("title1")).to eq(a4)
	end

end