class PagesController < ApplicationController
  def home
    @posts = Blog.all
    @skills = Skill.all
  end

  def about; end

  def contact; end

  def tech_news
    @tweets =
      begin
        SocialTool.twitter_search
      rescue Twitter::Error::Unauthorized
        ['There was an error contacting the Twitter API. Visit https://twitter.com instead.']
      end
  end
end
