# tale_weaver
The frontend for the Tale Weaver app.

## Prerequisites
* `Node.js` v14.x or later
* `npm` v6.14.4 or later
* `git` v2.14.1 or later
* `Flutter` v3.3 or later

Create an AWS Account and Install the Amplify CLI:
```bash
npm install -g @aws-amplify/cli
```

Configure the Amplify CLI:
```bash
amplify configure
```

## Getting Started
To generate the routes:
```bash
dart run build_runner build
```

```bash
flutter doctor
```

```bash
dart fix --dry-run
```

Components that use Material Widgets: 
* `content_studio_form`: Divider,
* `account_screen`: Circle Avatar,
* `collapsing_app_bar`: SliverAppBar,