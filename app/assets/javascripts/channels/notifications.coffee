NotifyListener = (data) ->
  user = $('#admin_user_' + data['user_id'])
  if user.length > 0
    $('#admin_user_' + data['user_id'] + ' + tr').remove()
    user.replaceWith data['content']
  else
    $('#list_user').append data['content']
  $('#notificationList').prepend(data['notification']);
  $('#notification-counter').html(data['counter']);

App.notifications = App.cable.subscriptions.create "NotificationsChannel",
  received: (data) ->
    NotifyListener(data)
