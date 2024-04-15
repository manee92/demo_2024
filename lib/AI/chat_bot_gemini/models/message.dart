import 'package:flutter/foundation.dart' show immutable;

@immutable
class Message {
  final String id;
  final String message;
  final String? imageUrl;
  final DateTime createdAt;
  final bool myMessage;

  const Message({
    required this.id,
    required this.message,
    this.imageUrl,
    required this.createdAt,
    required this.myMessage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'message': message,
      'imageUrl': imageUrl,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'isMine': myMessage,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'] as String,
      message: map['message'] as String,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      myMessage: map['isMine'] as bool,
    );
  }

  Message copyWith({
    String? imageUrl,
  }) {
    return Message(
      id: id,
      message: message,
      createdAt: createdAt,
      myMessage: myMessage,
      imageUrl: imageUrl,
    );
  }
}
