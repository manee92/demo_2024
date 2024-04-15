import 'package:flutter/material.dart';

import '../models/message.dart';


class MessageTile extends StatelessWidget {
  final Message message;
  final bool isOutgoing;

  const MessageTile({
    super.key,
    required this.message,
    required this.isOutgoing,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isOutgoing ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        decoration: BoxDecoration(
          color: isOutgoing ? const Color(0xff635a72) : const Color(0xfffffafe),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.message,
              style: TextStyle(
                color: isOutgoing ? Colors.white : Colors.black,
                fontSize: 16.0,
              ),
            ),
            message.imageUrl != null ?
                Column(
                  children: [
                    const SizedBox(height: 10),
                    Image.network(message.imageUrl!)
                  ],
                )
          : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
