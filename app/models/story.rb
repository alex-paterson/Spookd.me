class Story < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]
	def slug_candidates
		[
		  :username
		]
	end

	# include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks

  default_scope { order('created_at DESC') }

	has_many :tag_stories, inverse_of: :story, dependent: :destroy
	has_many :tags, through: :tag_stories
	# has_many :tags, through: :tag_stories, after_add:    [ lambda { |a,c| a.__elasticsearch__.index_document } ],
  #                                      after_remove: [ lambda { |a,c| a.__elasticsearch__.index_document } ]

	belongs_to :user
	has_many :pictures

	validates :fullname, presence: true
	validates :username, presence: true, uniqueness: true
	validates :avatar, presence: true

	def all_tags(names)
	  self.tags = names.split(",").map do |name|
	      Tag.where(name: name.strip.downcase).first_or_create!
	  end
	  self.all_tags_string = names
	end

	def all_tags
	  self.tags.map(&:name).join(", ")
	end

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "200x200>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end

# Story.import
