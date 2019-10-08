App.realtime = App.cable.subscriptions.create "RealtimeChannel",
  connected: ->
    console.log("adadadadasdasdadas")

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data)
