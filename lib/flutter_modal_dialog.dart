library modal_dialog;

import 'package:flutter/material.dart';

class _BaseAlertDialog extends StatelessWidget {
  const _BaseAlertDialog({
    this.content,
  });

  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      content: content,
    );
  }
}

class _HiddenContent extends StatefulWidget {
  const _HiddenContent({
    required this.visibleText,
    required this.hiddenText,
  });

  final String visibleText;
  final String hiddenText;

  @override
  State<_HiddenContent> createState() => _HiddenContentState();
}

class _HiddenContentState extends State<_HiddenContent> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        width: double.maxFinite,
        duration: const Duration(seconds: 5),
        curve: Curves.bounceOut,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Visibility(
              visible: !isExpanded,
              child: Text(widget.visibleText),
            ),
            Visibility(
              visible: isExpanded,
              child: Text(
                widget.hiddenText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The ModalDialog class is a collection of static methods that can be used to
/// show different types of modal dialogs.
class ModalDialog {
  /// Shows a simple dialog with a title and a button.
  static simple({
    required BuildContext context,
    required String title,
    required String buttonText,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return _BaseAlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(
                color: Colors.transparent,
                height: 18,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF303F9F),
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
              const Divider(
                color: Color(0xFFDBDDE0),
                height: 36,
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xFFFCE444)),
                    minimumSize:
                        MaterialStatePropertyAll(Size(double.infinity, 35)),
                    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                    ),
                  ),
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                      color: Color(0xFF25282B),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Shows a dialog with a title, a message and a button.
  /// The message can be expanded to show more details.
  /// The detail parameter is optional.
  /// If the detail parameter is not null, the message can be expanded.
  static detailed({
    required BuildContext context,
    required String title,
    required String message,
    String? detail,
    required String buttonText,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return _BaseAlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(
                color: Colors.transparent,
                height: 18,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF303F9F),
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
              const Divider(
                color: Colors.transparent,
                height: 9,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF52575C),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
              const Divider(
                color: Color(0xFFDBDDE0),
                height: 36,
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xFFFCE444)),
                    minimumSize:
                        MaterialStatePropertyAll(Size(double.infinity, 35)),
                    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                    ),
                  ),
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                      color: Color(0xFF25282B),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Divider(
                color: Color(0xFFDBDDE0),
                height: 36,
              ),
              Visibility(
                visible: detail != null,
                child: Align(
                  alignment: Alignment.center,
                  child: _HiddenContent(
                    visibleText: "Show details",
                    hiddenText: detail ?? "",
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  /// Shows a dialog with a title and a message.
  /// This dialog can only be dismissed by the application, since it has no
  /// buttons.
  /// You should ALWAYS pair this dialog with a `Future.delayed()` and a
  /// `Navigator.pop()` to dismiss it.
  static waiting({
    required BuildContext context,
    required String message,
    String? detail,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return _BaseAlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(
                color: Colors.transparent,
                height: 18,
              ),
              const Center(
                child: LinearProgressIndicator(color: Color(0xFF303F9F)),
              ),
              const Divider(
                color: Colors.transparent,
                height: 18,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF25282B),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Visibility(
                visible: detail != null,
                child: Column(
                  children: [
                    const Divider(
                      color: Colors.transparent,
                      height: 6,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        detail ?? "",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF52575C),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.transparent,
                height: 12,
              ),
            ],
          ),
        );
      },
    );
  }

  static confirmation({
    required BuildContext context,
    required String title,
    required String message,
    String? yesButtonText,
    String? noButtonText,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return _BaseAlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(
                color: Colors.transparent,
                height: 18,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF303F9F),
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
              const Divider(
                color: Color(0xFFDBDDE0),
                height: 36,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF52575C),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
              const Divider(
                color: Color(0xFFDBDDE0),
                height: 36,
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Flexible(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context, true),
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Color(0xFF28A745),
                          ),
                          minimumSize: MaterialStatePropertyAll(
                            Size(double.infinity, 35),
                          ),
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                          ),
                        ),
                        child: Text(
                          yesButtonText ?? "Yes",
                          style: const TextStyle(
                            color: Color(0xFFEFF4FF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const VerticalDivider(
                      color: Colors.transparent,
                      width: 15,
                    ),
                    Flexible(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context, false),
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Color(0xFFDC3545),
                          ),
                          minimumSize: MaterialStatePropertyAll(
                            Size(double.infinity, 35),
                          ),
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                          ),
                        ),
                        child: Text(
                          noButtonText ?? "No",
                          style: const TextStyle(
                            color: Color(0xFFEFF4FF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
