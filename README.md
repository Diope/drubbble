# Drubbble

## About

A simple Dribbble clone. I'm not a fan of putting up a bunch of screencasts onto my repository. I mean what does that tell you about my abilities?
That I'm good at copying code shown to me by someone far better me? You can argue there's merit in learning by such a method, but I feel I learn more when I do things on my own. This is something I want to truly make a career and I don't want to get my first job off the back of someone else's screencasts/work.

I'm going to try to add as much as I can to mimic dribbble, this README will serve as my log of changes in lieu of commit messages (well I'll still use commit messages, but I feel it'll be better to post my log here.)

## Changelog

### November 13, 2018
* Starting this all over again!
* Start the slow and painful journey that is updating this to Rails-API on Rails 5.2

It's interesting that even after 3 years of working on React, Vue, Express APIs, I still remember os much of rails workflow. It also helps that many other frameworks I've worked on/with adopted the Rails flow (Laravel/PHP), it is still weird to go back to more static frontends and the server not spitting out APIs. I will say this to my dying breath SQL DBs > NoSQL DBs!



### August 15, 2015
* Added the ability for users to upload photos to their posts (userShot column on post model).
* Displayed avatar on index page.
* Added default avatar when user has not supplied avatar.

### August 14, 2015
* Added a basic tagging system utilizing a join table (`has_many, through`).
* Dropped carrierwave for paperclip and added user avatars. Still need to add validations.
* Small bit of front end work, mostly with the avatars.

### July 24, 2015
* Added followers page

### July 23, 2015
* Added pagination

### July 22nd, 2015
* Added the ability to follow other users. Used a join table (`has_many, through`)
* Utilized `accepts_nested_attributes_for` along with one-to-one association and `after_create: :create_profile` to create a profile page for users ontop of Devise....this took me a while to figure out.

### July 14th, 2015
* Updated navigation scss
* Added comments (model, controller, association, routing).

### July 12th, 2015
* Added user roles via enums

### July 7th, 2015
* Added username to devise
* Added Posts (shots)


## Stack

### Design
* [Bourbon](http://bourbon.io/)
* [Neat](http://neat.bourbon.io/)
* [Bitters](http://bitters.bourbon.io/)
* Paperclip
* Fontawesome

### Utilities
* TDD stack using Unit Testing, Minitest and Guard.
* Devise
