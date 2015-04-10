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
bundle install, and run rake spec to run the rspec/capybara test suite

* Deployment instructions
Follow the heroku deployment instructions.  Create and migrate the database.
Add all required keys, install mandrill add-on for the emailing service.

[![Build Status](https://travis-ci.org/SensitiveLion/cardboard.svg?branch=master)](https://travis-ci.org/SensitiveLion/cardboard) [![Code Climate](https://codeclimate.com/github/SensitiveLion/cardboard.png)](https://codeclimate.com/github/SensitiveLion/cardboard) [![Coverage Status](https://coveralls.io/repos/SensitiveLion/cardboard/badge.png)](https://coveralls.io/r/SensitiveLion/cardboard)
