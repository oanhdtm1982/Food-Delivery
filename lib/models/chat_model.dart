class ChatModel {
  String idChat;
  String chatName;
  String chatUrlImage;
  String time;
  String messageLast;

  ChatModel({
    this.idChat = '',
    this.chatName = '',
    this.chatUrlImage = '',
    this.time = '',
    this.messageLast = '',
  });
}

List chatDemo = [
  ChatModel(
    idChat: '1',
    chatName: 'Anamwp',
    time: '20:00',
    chatUrlImage: 'assets/images/chat1.png',
    messageLast: 'Hello, how are you?',
  ),
  ChatModel(
    idChat: '2',
    chatName: 'Guy Hawkins',
    time: '20:00',
    chatUrlImage: 'assets/images/chat2.png',
    messageLast: 'Hello, how are you?',
  ),
  ChatModel(
    idChat: '3',
    chatName: 'Leslie Alexander',
    time: '20:00',
    chatUrlImage: 'assets/images/chat3.png',
    messageLast: 'Hello, how are you?',
  ),
];
