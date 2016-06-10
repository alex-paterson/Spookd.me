class StaticPagesController < ApplicationController
	before_action :check_logged_in, only: :account
	def home
		if Rails.env == 'production'
			@stories = Story.all.where(username: ['amirbloom', 'emrata', 'djkhaled', 'kanyewest', 'officialzoella', 'daverosey','rihanna'])
		else
			@stories = Story.all
		end
		@articles = Article.all.where(public: true)

		@headline_story = @stories.first
		@headline_article = @articles.first
		@second_row_stories = @stories[1..1]
		@second_row_articles = @articles[1..2]
		@third_row_stories = @stories[2..4]


	end

	def account
		@stories = current_user.stories
	end

	def claim
	end

	# def search
	# 	@stories = Story.search(params[:q]).records.take(5)
	# 	@articles = Article.search(params[:q]).records.where(public: true).take(5)
	# 	@pictures = Picture.search(params[:q]).records.take(5)
	# 	puts(@pictures)
	# end

	private

		def search_params
			params.permit(:query, :stories, :articles, :screenshots)
		end

end
