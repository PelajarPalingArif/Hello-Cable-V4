import consumer from "./consumer"
document.addEventListener('turbo:load', () => {
  const messagesContainer = document.getElementById('messages')
  if (messagesContainer) {
    const roomId = messagesContainer.dataset.roomId
    console.log(roomId);
    consumer.subscriptions.create({ channel: "RoomChannel", room_id: roomId }, {
      connected() {
        console.log("connected")
        console.log(roomId)
      },
      received(data) {
        let messageBuilder = document.createElement("p");
        
        messageBuilder.innerHTML = `<strong>${data.user_name}</strong> : ${data.message}`;
        console.log(messageBuilder);
        messagesContainer.appendChild(messageBuilder);
      }
    })
  }
});
