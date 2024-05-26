# Simple Note Taking App

A simple and colorful note-taking app built with Flutter. This application allows you to add, edit, and delete notes, each with a randomly assigned background color. The app uses SQLite for local data storage.

## Table of Contents

- [Features](#features)
- [Screenshots](#screenshots)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Dependencies](#dependencies)
- [License](#license)

## Features

- Add new notes
- Edit existing notes
- Delete notes
- Randomly assigned background colors for each note
- Persistent storage using SQLite

## Screenshots

![Screenshots] (https://drive.google.com/drive/folders/1sXhtlWDwkV8YD9PdY8eE-oc-GAVAnpj8?usp=sharing)

! [Demo] (https://drive.google.com/file/d/1oDAhL_Pw6D7IqAaWkG3hLYqXb_DPhRBI/view?usp=sharing)
## Installation

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart: Included with Flutter
- A code editor (VS Code, Android Studio, etc.)

### Steps

1. **Clone the repository:**

   ```bash
   git clone hhttps://github.com/nitin1359/noteapp.git
   cd noteapp
2. **Install dependencies:**
```bash
flutter pub get

3. **Run the app:**
```bash
flutter run

### Usage
## Adding a Note
Tap the floating action button (+) at the bottom right corner of the screen.
Enter the title and content of the note.
Press Add to save the note.
## Editing a Note
Tap on the note you want to edit.
Update the title and/or content.
Press Save to update the note.
## Deleting a Note
Tap the delete icon (🗑️) on the note you want to delete.
Confirm the deletion in the dialog that appears.

###Project Structure
simple_note_taking_app/
├── lib/
│   ├── constants/
│   │   └── colors.dart
│   ├── models/
│   │   └── note.dart
│   ├── screens/
│   │   └── note_list_screen.dart
│   ├── services/
│   │   └── database_helper.dart
│   ├── widgets/
│   │   └── confirm_dialog.dart
│   ├── app_theme.dart
│   └── main.dart
│
│
│
├── pubspec.yaml
└── README.md


### Description
constants/colors.dart: Contains a list of background colors used for notes.
models/note.dart: Defines the Note model.
screens/note_list_screen.dart: The main screen of the app displaying the list of notes.
services/database_helper.dart: Handles SQLite database operations.
widgets/confirm_dialog.dart: Contains the confirmation dialog widget used for note deletion.
app_theme.dart: Contains the app's theme data.
main.dart: The entry point of the application.
Dependencies
sqflite: SQLite plugin for Flutter.
path_provider: A Flutter plugin for finding commonly used locations on the filesystem.
These dependencies are already specified in the pubspec.yaml file.

License
This project is licensed under the MIT License - see the LICENSE file for details.