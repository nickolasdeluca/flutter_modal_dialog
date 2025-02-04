import 'package:flutter/material.dart';
import 'package:flutter_modal_dialog/flutter_modal_dialog.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SimpleButton(
              onPressed: () {
                ModalDialog.simple(
                  context: context,
                  title: const ModalTitle(
                    text: "This is a short message",
                  ),
                  button: const ModalButton(
                    text: "Alright!",
                  ),
                );
              },
              buttonText: "Simple dialog",
            ),
            SimpleButton(
              onPressed: () {
                ModalDialog.detailed(
                  context: context,
                  title: const ModalTitle(text: "This is a short message"),
                  message: "This is larger message that explains the title",
                  detail: const ModalDetail(
                    visibleText: "Detailed message",
                    hiddenText: "This is a detailed message that contains more "
                        "information about the title and message",
                  ),
                  button: const ModalButton(text: "Alright!"),
                );
              },
              buttonText: "Detailed message dialog",
            ),
            SimpleButton(
              onPressed: () {
                ModalDialog.waiting(
                  context: context,
                  title: const ModalTitle(text: "Processing"),
                  message: "Please wait while we process your request",
                );

                Future.delayed(const Duration(seconds: 5), () {
                  Navigator.pop(context);
                });
              },
              buttonText: "Waiting dialog",
            ),
            SimpleButton(
                onPressed: () {
                  ModalDialog.confirmation(
                    context: context,
                    title: const ModalTitle(text: "Please confirm"),
                    message: "It's a simple Yes/No question",
                    confirmButton: const ModalButton(text: "true"),
                  );
                },
                buttonText: "Confirmation dialog"),
          ],
        ),
      ),
    );
  }
}

class SimpleButton extends StatelessWidget {
  const SimpleButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  final Function()? onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Color(0xFF303F9F)),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
