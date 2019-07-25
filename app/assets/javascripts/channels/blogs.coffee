$(document).on 'turbolinks:load', ->
  comments = $('#comments')

  if comments.length > 0
    App.global_chat = App.cable.subscriptions.create {
      channel: 'BlogsChannel',
      blog_id: comments.data('blogId')
    },
    connected: ->,
    disconnected: ->,
    received: (data) ->
      comments.append data['comment'],
    send_comment: (comment, blog_id) ->
      @perform 'send_comment', comment: comment, blog_id: blog_id

  $('#comment_form').submit (e) ->
    comment_content = $(this).find("#comment_content").val()

    if $.trim(comment_content).length > 1
      App.global_chat.send_comment(comment_content, comments.data('blog-id'))

      $(this).find("#comment_content").val('')

    return false


    