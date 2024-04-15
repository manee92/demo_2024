import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/image_picker.dart';
import '../providers/providers.dart';
import '../widgets/messages_list.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final TextEditingController _messageController;
  final apiKey = dotenv.env['API_KEY'] ?? '';
  XFile? image;

  @override
  void initState() {
    _messageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _pickImage() async {
    final pickedImage = await pickImage();
    if (pickedImage == null) {
      return;
    }
    setState(() => image = pickedImage);
  }

  void _removeImage() async {
    setState(() {
      image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffebe3f0),
      appBar: AppBar(
        title: const Text("My chat bot"),
        actions: [
          Consumer(builder: (context, ref, child) {
            return IconButton(
              onPressed: () {
                ref.read(authProvider).signOut();
              },
              icon: const Icon(
                Icons.logout,
              ),
            );
          }),
        ],
      ),
      body: Column(
        children: [
          // Message List
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              child: MessagesList(
                userId: FirebaseAuth.instance.currentUser!.uid,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
            ),
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: const Color(0xfffffafe),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Button
                IconButton(
                  onPressed: _pickImage,
                  icon: const Icon(
                    Icons.image_outlined,
                    color: Color(0xff9c979e),
                  ),
                ),
                // Message Text field
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xfff3eef4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          hintText: 'Enter your question',
                        ),
                      ),
                      SizedBox(height: image != null ? 15 : 0),
                      Visibility(
                          visible: image != null,
                          child: Stack(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                margin: const EdgeInsets.only(top: 10),
                                color: Colors.grey[200],
                                child: image != null
                                    ? Image.file(
                                        File(image!.path),
                                        fit: BoxFit.cover,
                                      )
                                    : const SizedBox(),
                              ),
                              GestureDetector(
                                onTap: _removeImage,
                                child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xfff3eef4),
                                    ),
                                    margin: const EdgeInsets.only(left: 85),
                                    child: const Icon(Icons.close)),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                // Send Button
                IconButton(
                  onPressed: image != null ? sendImageMessage : sendMessage,
                  icon: const Icon(
                    Icons.send_outlined,
                    color: Color(0xff9c979e),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future sendMessage() async {
    final message = _messageController.text.trim();
    if (message.isEmpty) return;
    await ref.read(chatProvider).sendTextMessage(
          apiKey: apiKey,
          textPrompt: _messageController.text,
        );
    _messageController.clear();
  }

  Future sendImageMessage() async {
    final message = _messageController.text.trim();
    if (image == null || message.isEmpty) return;
    await ref.read(chatProvider).sendMessage(
          apiKey: apiKey,
          image: image,
          promptText: _messageController.text.trim(),
        );
    _messageController.clear();
    _removeImage();
  }
}
