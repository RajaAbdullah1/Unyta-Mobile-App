import 'package:flutter/material.dart';
import '../../../widgets/ChatAppBar/chat_app_bar.dart';
import '../../../widgets/ChatInputBar/chat_input_bar.dart';
import '../../../widgets/FileMessageBubble/file_mesage_bubble.dart';
import '../../../widgets/IncomeMessageBubble/income_message_bubble.dart';
import '../../../widgets/OutGoingMessageAttachment/outgoing_message_attachment.dart';

class ChatInboxScreen extends StatefulWidget {
  const ChatInboxScreen({super.key});

  @override
  State<ChatInboxScreen> createState() => _ChatInboxScreenState();
}

class _ChatInboxScreenState extends State<ChatInboxScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: ChatAppBar(
        title: "Skin Treats",
        subtitle: "Verified Brand",
        imagePath: "assets/images/reviewImage.png",
        isVerified: true,
        onBack: () {},
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                FileMessageBubble(
                  message:
                      "Hi, Excited to start working together.\nI’ve attached the campaign brief below.",
                  fileName: "Campaign Brief.pdf",
                  fileSize: "12 KB",
                  fileIconPath: "assets/images/pdf_file.png",
                  time: "9.30",
                  downloadIconPath: "assets/images/document_download.png",
                  onDownload: () {
                    // Handle file download here
                  },
                ),
                IncomingMessageWidget(
                  message:
                      "Great! I’ll review the brief and get back to you shortly",
                  time: "9:30pm",
                ),
                OutgoingMessageAttachment(
                  imagePath: "assets/images/chat_image.png",
                  time: "9:30pm",
                ),
                OutgoingMessageWidget(
                  message: "Here’s the first photo! Let me know your thoughts",
                  time: "9:30pm",
                ),
                IncomingMessageWidget(
                  message: "This looks fantastic! I love the clean aesthetic.",
                  time: "9:30pm",
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: ChatInputBar(
        controller: controller,
        onAttach: () {},
        onImage: () {},
        onSend: () {},
      ),
    );
  }
}
