module ApplicationHelper
  def logged_in?
    current_user.is_a?(User)
  end
end
