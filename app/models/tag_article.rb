class TagArticle < ActiveRecord::Base
	belongs_to :tag
	belongs_to :article

	validates :tag, presence: true
	validates :article, presence: true
end
