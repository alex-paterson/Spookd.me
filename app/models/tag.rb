class Tag < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]
	def slug_candidates
		[
		  :name,
		  [:name, :id]
		]
	end

	has_many :tag_stories, inverse_of: :tag, dependent: :destroy
	has_many :tag_articles, inverse_of: :tag, dependent: :destroy
	has_many :stories, through: :tag_stories
	has_many :articles, through: :tag_articles

  default_scope { order('created_at DESC') }

  validates :name, uniqueness: true
	validates :name, length: { minimum: 1, maximum: 30}
end
