$(document).ready ->
  App.appearance = App.cable.subscriptions.create({ channel: 'AppearanceChannel' },
    received: (data) ->
      user = $(".user-#{data['user_id']}")
      user.toggleClass 'online', data['online']
  )
