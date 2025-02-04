library modal_dialog;

import 'package:flutter/material.dart';

class _BaseAlertDialog extends StatelessWidget {
  const _BaseAlertDialog({
    this.content,
  });

  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: content,
        ),
      ),
    );
  }
}

class _HiddenContent extends StatefulWidget {
  const _HiddenContent({
    required this.content,
  });

  final ModalDetail? content;

  @override
  State<_HiddenContent> createState() => _HiddenContentState();
}

class _HiddenContentState extends State<_HiddenContent> {
  bool isExpanded = false;

  CrossFadeState _crossFadeState() {
    return isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.content == null) {
      return Container(height: 0);
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedCrossFade(
        firstChild: Text(
          widget.content!.visibleText,
          textAlign: TextAlign.center,
        ),
        secondChild: Text(
          widget.content!.hiddenText,
          textAlign: TextAlign.center,
        ),
        crossFadeState: _crossFadeState(),
        duration: const Duration(milliseconds: 100),
      ),
    );
  }
}

/// The ModalButton class is used to define the button that will be shown in
/// the modal dialog.
/// The `buttonText` parameter is required and defines the text that will be
/// shown in the button.
/// The `buttonColor` parameter is optional and defines the color of the button.
class ModalButton {
  const ModalButton({
    required this.text,
    this.textColor,
    this.color,
  });

  final String text;
  final Color? textColor;
  final Color? color;
}

/// The ModalTitle class is used to define the title that will be shown in the
/// modal dialog.
/// The `titleText` parameter is required and defines the text that will be
/// shown in the title.
/// The `titleColor` parameter is optional and defines the color of the title.
class ModalTitle {
  const ModalTitle({
    required this.text,
    this.color,
  });

  final String text;
  final Color? color;
}

/// The ModalDetail class is used to define the optional detail that will be
/// shown in the modal dialog.
/// The `visibleText` parameter is optional and defines the text that will be
/// shown when the detail is hidden.
/// The `hiddenText` parameter is optional and defines the text that will be
/// shown when the detail is expanded.
class ModalDetail {
  const ModalDetail({
    required this.visibleText,
    required this.hiddenText,
  });

  final String visibleText;
  final String hiddenText;
}

/// The ModalDialog class is a collection of static methods that can be used to
/// show different types of modal dialogs.
class ModalDialog {
  /// Shows a simple dialog with a title and a button.
  /// If the color of the button is not defined, it will be `#FCE444` by
  /// default.
  static Future<void> simple({
    required BuildContext context,
    required ModalTitle title,
    required ModalButton button,
  }) {
    return showDialog<void>(
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
                  title.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: title.color ?? const Color(0xFF303F9F),
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
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      button.color ?? const Color(0xFFFCE444),
                    ),
                    minimumSize: const WidgetStatePropertyAll(
                      Size(double.infinity, 35),
                    ),
                    shape: const WidgetStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                    ),
                  ),
                  child: Text(
                    button.text,
                    style: TextStyle(
                      color: button.textColor ?? const Color(0xFF25282B),
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

  /// Shows a detailed dialog with a title, a message, a button and an optional
  /// detail.
  /// If the color of the button is not defined, it will be `#FCE444` by
  /// default.
  /// If the color of the title is not defined, it will be `#303F9F` by
  /// default.
  /// If the detail is shown, a divider will be shown between the button and
  /// the detail.
  /// You can define the text that will be shown when the detail is hidden and
  /// the text that will be shown when the detail is expanded.
  static Future<void> detailed({
    required BuildContext context,
    required ModalTitle title,
    required String message,
    ModalDetail? detail,
    required ModalButton button,
  }) {
    return showDialog<void>(
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
                  title.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: title.color ?? const Color(0xFF303F9F),
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
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      button.color ?? const Color(0xFFFCE444),
                    ),
                    minimumSize: const WidgetStatePropertyAll(
                      Size(double.infinity, 35),
                    ),
                    shape: const WidgetStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                    ),
                  ),
                  child: Text(
                    button.text,
                    style: TextStyle(
                      color: button.textColor ?? const Color(0xFF25282B),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: detail != null,
                child: Column(
                  children: [
                    const Divider(
                      color: Color(0xFFDBDDE0),
                      height: 36,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: _HiddenContent(content: detail),
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

  /// Shows a dialog with a title and a message.
  /// This dialog can only be dismissed by the application, since it has no
  /// buttons.
  /// You should pair this dialog with a `Future.delayed()` and a
  /// `Navigator.pop()` to dismiss it.
  static Future<void> waiting({
    required BuildContext context,
    required ModalTitle title,
    String? message,
  }) {
    return showDialog<void>(
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
                  title.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: title.color ?? const Color(0xFF25282B),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Visibility(
                visible: message != null,
                child: Column(
                  children: [
                    const Divider(
                      color: Colors.transparent,
                      height: 6,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        message ?? "",
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

  /// Shows a dialog with a title, a message and two buttons.
  /// The buttons are labeled "Yes" and "No" by default, but you can change
  /// them by passing the `yesButtonText` and `noButtonText` parameters.
  static Future<bool?> confirmation({
    required BuildContext context,
    required ModalTitle title,
    required String message,
    ModalButton? confirmButton,
    ModalButton? cancelButton,
  }) {
    return showDialog<bool>(
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
                  title.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: title.color ?? const Color(0xFF303F9F),
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
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            confirmButton?.color ?? const Color(0xFF28A745),
                          ),
                          minimumSize: const WidgetStatePropertyAll(
                            Size(double.infinity, 35),
                          ),
                          shape: const WidgetStatePropertyAll<
                              RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                          ),
                        ),
                        child: Text(
                          confirmButton?.text ?? "Yes",
                          style: TextStyle(
                            color: cancelButton?.textColor ??
                                const Color(0xFFEFF4FF),
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
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            cancelButton?.color ?? const Color(0xFFDC3545),
                          ),
                          minimumSize: const WidgetStatePropertyAll(
                            Size(double.infinity, 35),
                          ),
                          shape: const WidgetStatePropertyAll<
                              RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                          ),
                        ),
                        child: Text(
                          cancelButton?.text ?? "No",
                          style: TextStyle(
                            color: cancelButton?.textColor ??
                                const Color(0xFFEFF4FF),
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
