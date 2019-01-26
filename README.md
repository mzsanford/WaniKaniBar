# WaniKaniBar

Simple Mac menu bar application for monitoring your [WaniKani](https://wanikani.com) reviews. Dark mode compatible icons and notifications when new reviews are available. This is a fork of bgriffith/WaniKaniBar with some additions.

## Screenshots

Icons come in inactive (no reviews pending) and active (reviews pending). There is also an optional time until next review listing:

![inactive, no time](https://user-images.githubusercontent.com/33917/51778915-28f9aa00-20b9-11e9-8eb4-facd9cf6ab43.png) ![inactive, with time](https://user-images.githubusercontent.com/33917/51778884-010a4680-20b9-11e9-88cc-94c61a28991f.png)

![active, no time](https://user-images.githubusercontent.com/33917/51779335-8f7fc780-20bb-11e9-8d6e-33d6d05b7d2d.png) ![active, time](https://user-images.githubusercontent.com/33917/51779334-8db60400-20bb-11e9-9b3f-b01dc34d572b.png)

There is a notification when reviews become available (soon to be optional). Click on this opens the WaniKani review page:

![Notification example](https://user-images.githubusercontent.com/33917/51780132-efc53800-20c0-11e9-9055-0901704319c2.png)

## Bug to fix in this fork

 - [x] Enable Notifications
 - [x] Add app icon to improve notification display
 - [x] Add notification click handling to open WaniKani reviews page
 - [x] Open the WaniKani settings page when clicked and API key is not yet present
 - [ ] Make notifications optional via preferences
 - [ ] Fix "Display time until next review" (not currently working)
 - [ ] Package for simple installation
 - [ ] Auto import API key
