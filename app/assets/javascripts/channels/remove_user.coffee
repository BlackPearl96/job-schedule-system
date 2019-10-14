App.remove_user = App.cable.subscriptions.create "RemoveUserChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    user_id = data["user_id"]
    chatroom_id = data["chatroom_id"]
    console.log(user_id)
    console.log(chatroom_id)
    $('#chatroom_user_id_' + user_id + '_chatroom_id_' + chatroom_id + '_class').load window.location + '#chatroom_user_id_' + user_id + '_chatroom_id_' + chatroom_id + '_class'
