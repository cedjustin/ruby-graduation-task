App.chat = App.cable.subscriptions.create("ChatChannel", {
  connected: function() {
    console.log("you have been connected to a chat")
  },
  disconnected: function() {
    console.log("disconnected from the chat")
  },
  received: function(data) {
    var messages = $('#chatbox');
    var messageBox = $('.message-area')

    messages.append(data['message']);
    messages.scrollTop(messages[0].scrollHeight);
    messageBox.val("");
  }
});
