class Article < ActiveRecord::Base
	validates :title, :content, presence: true

	paginates_per 10
end
