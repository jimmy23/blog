class Article < ActiveRecord::Base
	has_many :comments
	
	validates :title, :content, presence: true

	paginates_per 10
end
