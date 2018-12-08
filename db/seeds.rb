3.times do |topic|
  Topic.create(title: "Topic #{topic}")
end

10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: "Random blog body #{blog}",
    topic_id: Topic.last.id
  )
end

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: skill
  )
end

9.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: "Subtitle #{portfolio_item}",
    body: "Body #{portfolio_item}",
    main_image: 'https://via.placeholder.com/600x400',
    thumb_image: 'https://via.placeholder.com/350x200'
  )
end

3.times do |technology|
  Portfolio.last.technologies.create!(
    name: "Technology #{technology}"
  )
end
