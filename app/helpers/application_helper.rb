module ApplicationHelper
  def login_helper(class_name = '')
    if !current_user.is_a?(GuestUser)
      link_to 'Logout', destroy_user_session_path, method: :delete, class: class_name
    else
      register_link = link_to 'Register', new_user_registration_path, class: class_name
      login_link = link_to 'Login', new_user_session_path, class: class_name

      raw "#{register_link} #{login_link}"
    end
  end

  def source_helper(class_name)
    return unless session[:source]

    greeting = "Thanks for visiting me from #{session[:source]}, please feel free to #{link_to 'contact me', contact_path} if you'd like to work together!"
    content_tag :p, greeting.html_safe, class: class_name
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
      {
        url: tech_news_path,
        title: 'Tech News'
      }
    ]
  end

  def nav_helper(style, tag_type)
    nav_items.map do |nav_item|
      "<#{tag_type}><a href=\"#{nav_item[:url]}\" class=\"#{style} #{active? nav_item[:url]}\">#{nav_item[:title]}</a></#{tag_type}>"
    end.join('').html_safe
  end

  def active?(path)
    'active' if current_page? path
  end

  def alert(content)
    js add_gritter(content, title: "Dragomir Proychev's Portfolio", sticky: false)
  end
end
