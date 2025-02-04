# Changelog

## 0.0.1

* Initial release with basic dialogs.

## 0.0.2

* Added new type of dialog `ModalDialog.confirmation`

## 0.0.3

* There were a lot of breaking changes in this revision. You should definitely check the documentation. Added the option to set a custom color for the button and the title of the dialogs. In this revision, some `String` properties were replaced by the `ModalTitle`, `ModalButton` and `ModalDetail` objects.

## 0.0.4

* Fixed an issue with the `ModalDialog.detailed` where it would fail to build if the `detail` was null

## 0.0.5

* Code updates and setting the maximum width of the dialog to 400 to use the package with Flutter Web.
