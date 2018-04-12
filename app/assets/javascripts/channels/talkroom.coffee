App.talkroom = App.cable.subscriptions.create {channel: "TalkroomChannel", location_path: $(location).attr('pathname')},
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#chat_tab').children().append data['message']

  speak: (message, talkroom_id) -> 
    @perform 'speak', talkroom_id: talkroom_id, message: message

 $(document).on 'keypress', '[data-behavior~=talkroom_speaker]', (event) ->
    if event.keyCode is 13 # return = send
      App.talkroom.speak event.target.value, $('#talkroom_id').val()
      event.target.value = ''
      event.preventDefault()
