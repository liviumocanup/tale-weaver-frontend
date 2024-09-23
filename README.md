# Tale Weaver

**Tale Weaver** is a mobile-based multi-sensory AI storytelling platform. It generates personalized narratives based on user input, complete with thematic imagery, voiceover, and sound effects, using AI-enhanced algorithms.

<p align="center">
  <img src="https://github.com/liviumocanup/tale-weaver-frontend/blob/demo/demo/home.png" width="200" alt="Home Screen">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/liviumocanup/tale-weaver-frontend/blob/demo/demo/home-dark.png" width="200" alt="Home Screen Dark Mode">
</p>

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Installation](#installation)
3. [Running the Project](#running-the-project)
4. [Flutter Development Tools](#flutter-development-tools)

## Prerequisites
Make sure the following are installed before starting the project:

- **Node.js** `v14.x` or later
- **npm** `v6.14.4` or later
- **git** `v2.14.1` or later
- **Flutter** `v3.3` or later

<p align="center">
  <img src="https://github.com/liviumocanup/tale-weaver-frontend/blob/demo/demo/studio-1.png" width="200" alt="Generate Video">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/liviumocanup/tale-weaver-frontend/blob/demo/demo/studio-2.png" width="200" alt="Library">
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/liviumocanup/tale-weaver-frontend/blob/demo/demo/studio-3.png" width="200" alt="View Video">
</p>

### AWS Amplify Setup

You'll need an AWS account for the backend. Install and configure the Amplify CLI as follows:
1. Install Amplify CLI globally:
```bash
npm install -g @aws-amplify/cli
```

2. Configure Amplify:
```bash
amplify configure
```

## Installation
1. Clone this repository and Install the Flutter dependencies:
```bash
flutter pub get
```

2. To generate the routes:
```bash
dart run build_runner build
```

## Running the Project
Before running, ensure all dependencies are up to date:

1. Check Flutter environment:
```bash
flutter doctor
```

2. Apply any recommended Dart fixes:
```bash
dart fix --dry-run
```

3. Run the app:
```bash
flutter run
```

## Flutter Development Tools

The overall design of the app follows Cupertino (iOS-style) aesthetics, while certain components use Material Widgets for specific functionality.

The following components use **Material Widgets**:
* `content_studio_form`: Divider
* `account_screen`: Circle Avatar
* `collapsing_app_bar`: SliverAppBar