# Flutter modal dialog

A simple package with simple modal dialogs for people that don't want to create their own dialogs.

## Features

* Little customization required;
* Simple dialog to show a simple message;
* Detailed dialog can at the same time hide those nasty details and still deliver them if needed;
* Waiting dialog to show something while the application proccesses;

## Getting started

For a manual installation

In the `pubspec.yaml` of your flutter application, add the following:

```yaml
dependencies:
  modal_dialog: <latest_version>
```

You can also add it through pub.dev with the following command:

```shell
flutter pub add flutter_modal_dialog
```

## Usage

### ModalDialog.simple

`ModalDialog.simple` is a dialog that shows a single message, it should be short, like "Data was sent" or "Finished uploading", it has a single button that will dismiss the dialog.

```dart
ModalDialog.simple(
  context: context,
  title: "This is a short message",
  buttonText: "Alright!",
);
```

#### Preview

<p align="center">
  <img src="https://github.com/nickolasdeluca/flutter_modal_dialog/assets/17858166/929746ee-2034-4db7-b254-9fb205e3e146" width="200" height="395">
</p>

### ModalDialog.detailed

`ModalDialog.detailed` is the reason I created this package, to have a dialog that would show a title, a message and a hidden message that the user could tap and provide detailed information on why an error was thrown.

```dart
ModalDialog.detailed(
  context: context,
  title: "This is a short message",
  message: "This is larger message that explains the title",
  detail: "This is a detailed message that contains more "
      "information about the title and message",
  buttonText: "Alright!",
);
```

### Preview

Details hidden:

<p align="center">
  <img src="https://github.com/nickolasdeluca/flutter_modal_dialog/assets/17858166/ce164553-7f8a-433a-b435-2e69e26bdd87" width="200" height="395">
</p>

Details shown:

<p align="center">
  <img src="https://github.com/nickolasdeluca/flutter_modal_dialog/assets/17858166/fca7af04-92b8-49a5-a6fc-9e61e5e1afc5" width="200" height="395">
</p>

### ModalDialog.waiting

`ModalDialog.waiting` is a dialog without buttons. It was created to be used while the application processes something in the background and after that code gets executed, the dialog should be dismissed by the application as well.

```dart
ModalDialog.waiting(
  context: context,
  message: "Processing",
  detail: "Please wait while we process your request",
);

Future.delayed(const Duration(seconds: 5), () {
  Navigator.pop(context);
});
```

### Preview

<p align="center">
  <img src="https://github.com/nickolasdeluca/flutter_modal_dialog/assets/17858166/8ff0c2fc-db34-49c2-af2b-ff2d0e3f0aea" width="200" height="395">
</p>

## ModalDialog.confirmation

`ModalDialog.confirmation` will show a dialog with two buttons with Yes and No options. You can change the text for the buttons using the properties `yesButtonText` and `noButtonText`. I'll think of a better way to do this in the next revisions.

```dart
ModalDialog.confirmation(
  context: context,
  title: "Please confirm",
  message: "It's a simple Yes/No question",
  yesButtonText: "true",
);
```

### Preview

<p align="center">
  <img src="https://github.com/nickolasdeluca/flutter_modal_dialog/assets/17858166/388f3a56-a8d4-467f-b909-ef57b4b860c7" width="200" height="395">
</p>

## Additional information

This package is still in early development, things might change if I find it necessary. If you found any bugs, have any suggestions or want to contribute, feel free to open a PR and I'll gladly take a look into it.
