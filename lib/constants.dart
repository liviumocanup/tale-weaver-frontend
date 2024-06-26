import 'package:flutter/cupertino.dart';

const cPrimaryColor = Color.fromRGBO(139, 126, 236, 1);
const cPrimaryLightColor = Color.fromRGBO(192, 222, 255, 1);
const cAlwaysWhiteColor = CupertinoColors.white;
const cAlwaysBlackColor = CupertinoColors.black;
const cGrayColor = CupertinoColors.systemGrey;
const cGrayBackground = CupertinoColors.systemGroupedBackground;

// Story Feature
const localhostString = 'http://10.0.2.2:8081';
const cWordsPerStory = 500;

// Light Mode
// const cWhiteColor = cAlwaysWhiteColor;
// const cBlackColor = cAlwaysBlackColor;
// const cLightBrightness = Brightness.light;
// const cDarkBrightness = Brightness.dark;
// const cCollapsingAppBarBackground = cGrayBackground;
// final cOverlayColor = cGrayBackground.withOpacity(0.5);

// Dark Mode
const cWhiteColor = cAlwaysBlackColor;
const cBlackColor = cAlwaysWhiteColor;
const cLightBrightness = Brightness.dark;
const cDarkBrightness = Brightness.light;
const cCollapsingAppBarBackground = cAlwaysBlackColor;
final cOverlayColor = cAlwaysBlackColor.withOpacity(0.5);

// Greeting
const welcomeString = 'Welcome to,';
const title = 'Tale Weaver';

// Welcome
const logInString = 'Log In';
const logOutString = 'Log Out';
const signUpString = 'Sign Up';

// Home
const homeString = 'Home';
const contentStudioString = 'Content Studio';
const libraryString = 'Library';

// Home Tab
const welcomeBackString = 'Welcome back,';
const storyOfTheDay = 'Story of the Day';
const myLibrary = 'My Library';
const subscriptionSummary = 'Subscription Summary';
const exploreMore = 'Explore More';

// Story of the Day
const sotdTitlePh = 'Whispers';
const sotdLocationPh = 'Woods';
const sotdDescriptionPh =
    "As the moon casts an eerie glow upon the forest, a group of unsuspecting adventurers seeks shelter from a sudden storm. Oblivious to the cottage's dark history, they enter its creaking doors, only to find themselves ensnared in a web of malevolent forces.";
const sotdLengthPh = '~ 12 min';
const sotdImageAssetPh = 'assets/images/cabin-1.jpg';

// Subscription Summary
const subscriptionTitlePh = 'Monthly Plan';
const subscriptionTimePh = 'Expires in 30 days';
const subscriptionImageAsset = 'assets/images/subscription-1.png';

// Explore More
const explore1Title = 'The Curse Of Crimson Manor';
const explore1Location = 'Forgotten Village';
const explore1Length = '~25 min';
const explore1ImageAsset = 'assets/images/village-1.jpg';

const explore2Title = 'Echoes';
const explore2Location = 'Upside Down';
const explore2Length = '~20 min';
const explore2ImageAsset = 'assets/images/other-1.jpg';

const explore3Title = 'The Shadows of the Fog';
const explore3Location = 'Misty Mountains';
const explore3Length = '~18 min';
const explore3ImageAsset = 'assets/images/mountains-1.jpg';

// Loading messages
const cLoadingVideoInfo = 'Loading the video...';
const cCreatingStoryInfo = 'Creating your story...';
const cLoadingStoryInfo = 'Loading the story...';
const cLoadingLibraryInfo = 'Loading your library...';

// Error messages
const cErrorLoadingVideo = 'Failed to start the video. Please try again!';
const cErrorCreatingStory = 'Failed to create the story. Please try again!';
const cErrorLoadingStory = 'Failed to load the story. Please try again!';
const cLibraryLoadError = 'Failed to load your library. Please try again!';

// Content Studio
const csTitleString = 'Content Studio';
const csDescriptionString = 'Description';
const csGenerateString = 'Generate';
const csDescriptionErrorString = 'Please enter a description';
const csLocationString = 'Location';
const csStoryDetailsString = 'Story Details';
const csNarratorSettingsString = 'Narrator Settings';
const csNarratorString = 'Voice';
const csNarratorPhString = 'Select a Voice';
const csNarratorErrorString = 'Please enter a voice ID';
const csSFXString = 'Sound Settings';

// Content Studio Form
const cTranscriptString = 'Transcript';
const cTitleString = 'Title';
const cSaveString = 'Save';
const cEditTitleString = 'Edit Title';

// Library
const libraryTitleString = 'Your Stories';
const cCancelString = 'Cancel';
const cRemoveString = 'Remove';
const cDeleteString = 'Delete';
const cDeleteConfirmation = 'Delete this Story?';
const cShareString = 'Share';
const cClipboardString = 'Story URL copied to clipboard.';

const Map<String, String> voices = {
  'Josh (Smooth/Bold)': 'TxGEqnHWrfWFTfGW9XjX',
  'Lily (Gentle)': 'pFZP5JQG7iQjIQuC4Bku',
  'Clyde (Grizzled)': '2EiwWnXFnvU5JabPnv8n',
  'Charlotte (Sensual)': 'XB0fDUnXU5powFXDhCwa',
  'Thomas (Serene/Soft)': 'GBv7mTt0atIp3Br8iCZE',
  'Nicole (Whispery)': 'piTKgcLEGmPE4e6mEKli',
  'Chris (Easygoing)': 'iP95p4xoKVk53GoZ742B',
  'Dorothy (Soothing)': 'ThT5KcBeYPX3keUQqHPh',
  'Brian (Baritone)': 'nPczCjzI2devNBz1zQrb',
  'Callum (Fierce)': 'N2lVS1w4EtoT3dr4eOWO',
  'Ethan (ASMR)': 'g5CIjZEefAph4nQFvHAz',
};
