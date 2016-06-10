class Picture < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]
	def slug_candidates
		[
		  [:username, :title]
		]
	end

	# include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks

  default_scope { order('created_at DESC') }

	belongs_to :story
	belongs_to :user

  has_attached_file :avatar, styles: {
  	medium: "700x700>",
  	thumb: "200x200>"
  	}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

	validates :avatar, presence: true
	validates :title, presence: true
end

# Picture.import
