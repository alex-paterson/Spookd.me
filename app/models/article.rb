require 'friendly_id'
class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]
	def slug_candidates
		[
		  [:title],
		  [:title, :tagline]
		]
	end

	# include Elasticsearch::Model
  #   include Elasticsearch::Model::Callbacks

  default_scope { order('created_at DESC') }

	belongs_to :user

	has_many :tag_articles, inverse_of: :article, dependent: :destroy
	has_many :tags, through: :tag_articles

	validates :title, presence: true, length: {maximum: 50}
	validates :tagline, presence: true, length: {maximum: 75}
	validates :content, presence: true

	validates :cover, presence: true
    has_attached_file :cover, styles: { medium: "500x500>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/


	def all_tags=(names)
	  self.tags = names.split(",").map do |name|
	      Tag.where(name: name.strip.downcase).first_or_create!
	  end
	  self.all_tags_string = names
	end

	def all_tags
	  self.tags.map(&:name).join(", ")
	end
end

# Article.import
