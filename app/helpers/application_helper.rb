module ApplicationHelper
  def login_helper className = ""
    if !current_user.is_a?(GuestUser)
      link_to 'Logout', destroy_user_session_path, method: :delete, class: className
    else
      register_link = link_to 'Register', new_user_registration_path, class: className
      login_link = link_to 'Login', new_user_session_path, class: className

      raw "#{register_link} #{login_link}"
    end
  end

  def source_helper layout_name
    return unless session[:source]

    greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout"
    content_tag :p, greeting, class: 'source-greeting'
  end

  def copyright_generator
    ProychevViewTool::Renderer.copyright 'Dragomir Proychev', 'All rights reserved'
  end

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_me_path,
        title: 'About Me'
      },
      {
        url: contact_path,
        title: 'Contact'
      },
      {
        url: blogs_path,
        title: 'Blogs'
      },
      {
        url: portfolios_path,
        title: 'Portfolios'
      },
    ]
  end

  def nav_helper style, tag_type
    nav_items.map { |nav_item|
      "<#{tag_type}><a href=\"#{nav_item[:url]}\" class=\"#{style} #{active? nav_item[:url]}\">#{nav_item[:title]}</a></#{tag_type}>"
    }.join('').html_safe
  end

  def active? path
    "active" if current_page? path
  end
end
