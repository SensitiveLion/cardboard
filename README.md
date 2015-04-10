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
![Show Games](
https://i.imgur.com/nsmdIE5.png)
![Comments and Reviews](
https://i.imgur.com/rZ4MFgu.png)
![Game Index Search](
https://i.imgur.com/aGem1vg.png)
![Game Submit](
https://i.imgur.com/gSA0bp4.png)
![User Index](
https://i.imgur.com/SBfCDRi.png)
![User Profile](
https://i.imgur.com/f8Xfvo1.png)

[![Build Status](https://travis-ci.org/SensitiveLion/cardboard.svg?branch=master)](https://travis-ci.org/SensitiveLion/cardboard) [![Code Climate](
https://codeclimate.com/github/SensitiveLion/cardboard.png)](https://codeclimate.com/github/SensitiveLion/cardboard) [![Coverage Status](
https://coveralls.io/repos/SensitiveLion/cardboard/badge.png)](https://coveralls.io/r/SensitiveLion/cardboard)
