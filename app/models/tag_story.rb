class TagStory < ActiveRecord::Base
	belongs_to :tag
	belongs_to :story

	validates :tag, presence: true
	validates :story, presence: true
end
