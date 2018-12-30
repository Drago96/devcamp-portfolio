module ApplicationHelper
  def login_helper
    if logged_in?
      link_to 'Logout', destroy_user_session_path, method: :delete
    else
      register_link = link_to 'Register', new_user_registration_path
      login_link = link_to 'Login', new_user_session_path

      (content_tag :div, register_link) + (content_tag :div, login_link)
    end
  end

  def source_helper(layout_name)
    return unless session[:source]

    greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout"
    content_tag :p, greeting, class: 'source-greeting'
  end

  def copyright_generator
    ProychevViewTool::Renderer.copyright 'Dragomir Proychev', 'All rights reserved'
  end

  def logged_in?
    current_user.is_a?(User)
  end
end
