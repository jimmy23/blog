class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	
	validates :title, :content, presence: true

	paginates_per 10
end
