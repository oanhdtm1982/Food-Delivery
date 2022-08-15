// ignore: unused_import
import 'package:flutter/material.dart';

const String tableMessage = 'message';

class MessageFields {
  static const String idChat = '_idChat';
  static const String idUser = '_idUser';
  static const String text = 'Hello';
  static const String messageType = 'text';
  static const String messageStatus = 'sent';
  static const String isSender = "true";
}

enum MessageType { text, audio, image, video }

enum MessageStatus {
  // ignore: constant_identifier_names
  sent,
  not_sent
}

class Message {
  final int idUser;
  final int idChat;
  final String text;
  final MessageType messageType;
  final MessageStatus messageStatus;
  final bool isSender;

  Message(
      {required this.idChat,
      required this.idUser,
      required this.text,
      required this.messageType,
      required this.messageStatus,
      required this.isSender});
}

List demoMessages = [
  Message(
      idUser: 1,
      idChat: 2,
      text: "Hi Anamwp",
      messageType: MessageType.text,
      messageStatus: MessageStatus.sent,
      isSender: true),
  Message(
      idUser: 1,
      idChat: 2,
      text: "Hi Anamwp",
      messageType: MessageType.audio,
      messageStatus: MessageStatus.sent,
      isSender: false),
  Message(
      idUser: 1,
      idChat: 2,
      text: "Hi Anamwp",
      messageType: MessageType.image,
      messageStatus: MessageStatus.sent,
      isSender: true),
  Message(
      idUser: 1,
      idChat: 2,
      text: "Hi Anamwp",
      messageType: MessageType.text,
      messageStatus: MessageStatus.sent,
      isSender: false),
  Message(
      idUser: 1,
      idChat: 2,
      text: "Hi Anamwp",
      messageType: MessageType.text,
      messageStatus: MessageStatus.not_sent,
      isSender: true),
  Message(
      idUser: 1,
      idChat: 2,
      text: "Hello, how are you?",
      messageType: MessageType.text,
      messageStatus: MessageStatus.sent,
      isSender: true),
];
