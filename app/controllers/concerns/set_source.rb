module SetSource
  extend ActiveSupport::Concern

  included do
    before_action :set_source
  end

  private

  def set_source
    source_param = params[:q]
    session[:source] = source_param if source_param
  end
end
