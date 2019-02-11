module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  private

  def set_page_defaults
    @page_title = 'Devcamp Portfolio'
    @seo_keywords = 'Dragomir Proychev portfolio'
  end
end