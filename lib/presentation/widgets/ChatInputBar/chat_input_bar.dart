import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_border_radius.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/presentation/widgets/TextFieldWidget/text_field_widget.dart';

class ChatInputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onSend;
  final VoidCallback? onAttach;
  final VoidCallback? onImage;

  const ChatInputBar({
    super.key,
    required this.controller,
    this.onSend,
    this.onAttach,
    this.onImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: AppPaddings.horizontal16,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceDim,
            borderRadius: AppBorderRadius.roundedLarge,
          ),
          child: Row(
            children: [
              // Text field
              Expanded(
                child: TextFieldWidget(
                  controller: controller,
                  hintText: "Send Message",
                  keyboardType: TextInputType.text,
                  validator: (value) => null,
                ),
              ),

              // Action icons
              Row(
                children: [
                  IconButton(
                    onPressed: onAttach,
                    icon: Image.asset(
                      "assets/images/attachment_pin.png",
                      width: 30,
                      height: 30,
                    ),
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    onPressed: onImage,
                    icon: Image.asset(
                      "assets/images/image_attachment.png",
                      width: 30,
                      height: 30,
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: onSend,
                    icon: Image.asset(
                      "assets/images/send_icon.png",
                      width: 30,
                      height: 30,
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
