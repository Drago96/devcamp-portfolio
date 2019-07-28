class PagesController < ApplicationController
  def home; end

  def about
    @skills = Skill.all
  end

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
