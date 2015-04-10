# README

![boxxy](http://i.imgur.com/9n0cmic.gif "boxxy")

### Ruby version
Used version ruby 2.1.5p273

### System dependencies
None

### Configuration
Running this app will require an AWS S3 server to set up carrier wave.
You will need facebook and google dev accounts to set up the oauth logins.
For email notifications, you will need to add mandrill to your webserver.

### Database creation
rake db:create

### Database initialization
rake db:migrate

### How to run the test suite
bundle install, run rake db:test:prepare and then run rake spec to run the rspec/capybara test suite

### Deployment instructions
Follow the heroku deployment instructions.  Create and migrate the database.
Add all required keys, install mandrill add-on for the emailing service.

## Images of the app
#### The main home page of cardboard
![Home Page](
https://i.imgur.com/H7bMWy2.jpg)

#### Game show page
![Show Games](
https://i.imgur.com/nsmdIE5.png)

#### Reviews and their comments on game page
![Comments and Reviews](
https://i.imgur.com/rZ4MFgu.png)

#### The index of all pages and search function
![Game Index Search](
https://i.imgur.com/aGem1vg.png)


#### An example of a form
![Game Submit](
https://i.imgur.com/gSA0bp4.png)

#### A list of all gamers registered with the site
![User Index](
https://i.imgur.com/SBfCDRi.png)

#### User profile
![User Profile](
https://i.imgur.com/f8Xfvo1.png)


[![Build Status](https://travis-ci.org/SensitiveLion/cardboard.svg?branch=master)](https://travis-ci.org/SensitiveLion/cardboard) [![Code Climate](
https://codeclimate.com/github/SensitiveLion/cardboard.png)](https://codeclimate.com/github/SensitiveLion/cardboard) [![Coverage Status](
https://coveralls.io/repos/SensitiveLion/cardboard/badge.png)](https://coveralls.io/r/SensitiveLion/cardboard)
