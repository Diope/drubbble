# Drubbble

## About

A simple Dribbble clone. I'm not a fan of putting up a bunch of screencasts onto my repository. I mean what does that tell you about my abilities?
That I'm good at copying code shown to me by someone far better me? You can argue there's merit in learning by such a method, but I feel I learn more when I do things on my own. This is something I want to truly make a career and I don't want to get my first job off the back of someone else's screencasts/work.

I'm going to try to add as much as I can to mimic dribbble, this README will serve as my log of changes in lieu of commit messages (well I'll still use commit messages, but I feel it'll be better to post my log here.)

## Changelog

#### Users
* ~~Utilize Devise in lieu of own authorization to speed up development.~~
* Try using enums for roles
* Add profile model to keep app specific user info separate from user model.

#### Posts
* ~~Added "posts" controller and model with has_one, belongs_to association (user foreign key)~~
* Add column for images, add carrierwave/imagemagick gem for image handling.

#### Design
* General front end design utilizing [Bourbon](http://bourbon.io/), [Neat](http://neat.bourbon.io/), and [Bitters](http://bitters.bourbon.io/)
