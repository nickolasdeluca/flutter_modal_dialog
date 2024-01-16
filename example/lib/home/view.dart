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
                  title: "This is a short message",
                  buttonText: "Alright!",
                );
              },
              buttonText: "Simple dialog",
            ),
            SimpleButton(
              onPressed: () {
                ModalDialog.detailed(
                  context: context,
                  title: "This is a short message",
                  message: "This is larger message that explains the title",
                  detail: "This is a detailed message that contains more "
                      "information about the title and message",
                  buttonText: "Alright!",
                );
              },
              buttonText: "Detailed message dialog",
            ),
            SimpleButton(
              onPressed: () {
                ModalDialog.waiting(
                  context: context,
                  message: "Processing",
                  detail: "Please wait while we process your request",
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
                    title: "Please confirm",
                    message: "It's a simple Yes/No question",
                    yesButtonText: "true",
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
        backgroundColor: MaterialStatePropertyAll(Color(0xFF303F9F)),
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
