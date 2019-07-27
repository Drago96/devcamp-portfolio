class TopicsController < ApplicationController
  layout 'blogs'

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])

    @blogs = @topic.blogs.yield_self do |blogs|
      if logged_in?(:site_admin)
        blogs
      else
        blogs.published
      end
    end.recent.page(params[:page]).per(5)
  end
end
