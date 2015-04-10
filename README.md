README

* Ruby version
Used version ruby 2.1.5p273

* System dependencies

* Configuration
Running this app will require an AWS S3 server to set up carrier wave.
You will need facebook and google dev accounts to set up the oauth logins.
For email notifications, you will need to add mandrill to your webserver.

* Database creation
rake db:create

* Database initialization
rake db:migrate

* How to run the test suite
bundle install, run rake db:test:prepare and then run rake spec to run the rspec/capybara test suite

* Deployment instructions
Follow the heroku deployment instructions.  Create and migrate the database.
Add all required keys, install mandrill add-on for the emailing service.

![Home Page](
https://i.imgur.com/H7bMWy2.jpg)
The main home page of cardboard

![Show Games](
https://i.imgur.com/nsmdIE5.png)
When click on a game this is a example of a page

![Comments and Reviews](
https://i.imgur.com/rZ4MFgu.png)
When there are comments and reviws this will show below the game

![Game Index Search](
https://i.imgur.com/aGem1vg.png)
To see more thatn the up and coming games go to the games index. it is also possible to seach for games from here as well as the main page

![Game Submit](
https://i.imgur.com/gSA0bp4.png)
An example of a form. This one is for submiting a game.

![User Index](
https://i.imgur.com/SBfCDRi.png)
A list of all gamers registered with the site

![User Profile](
https://i.imgur.com/f8Xfvo1.png)
Clicking on a name of your username in the menu bar when you are signed in will bring you to a profile like this.

[![Build Status](https://travis-ci.org/SensitiveLion/cardboard.svg?branch=master)](https://travis-ci.org/SensitiveLion/cardboard) [![Code Climate](
https://codeclimate.com/github/SensitiveLion/cardboard.png)](https://codeclimate.com/github/SensitiveLion/cardboard) [![Coverage Status](
https://coveralls.io/repos/SensitiveLion/cardboard/badge.png)](https://coveralls.io/r/SensitiveLion/cardboard)
