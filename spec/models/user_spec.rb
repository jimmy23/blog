require "rails_helper"

describe User, :type => :model  do
	describe "create" do
		it "should password,email is not null" do
			u1 = User.create(password: "123456")
			u2 = User.create(email: "123@163.com")
			u3 = User.create

			expect(u1.valid?).to be_falsey
			expect(u2.valid?).to be_falsey
			expect(u3.valid?).to be_falsey
		end

		it "should email is unique" do
			u1 = User.create(email: "123@163.com", password: "123456")
			u2 = User.create(email: "123@163.com", password: "654321")

			expect(u1.email).to eq("123@163.com")
			expect(u2.valid?).to be_falsey
			expect(u2.errors[:email]).to eq(["has already been taken"])
		end
	end

	describe "login in" do
		it 'should right password,email' do
			user = User.create(email: "1234@163.com", password: "111111")

			expect(User.authenticate(user.email, user.password)).to eq(user)
			expect(User.authenticate(user.email, "213213")).to eq(nil)
			expect(User.authenticate("rongyi@163.com", "213fse")).to eq(nil)
		end
	end

end