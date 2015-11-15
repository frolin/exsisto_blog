---
title: Padrino Inject
date: 2015-01-01
tags:  padrino
---

Getting Started

This is a guide intended for a developer that is just getting started with the Padrino web framework (and perhaps Sinatra or Ruby). This guide will give an overview the various other guides, resources and steps towards becoming a Sinatra + Padrino aficionado.

You may want to skim through sections you already are familiar with. If you are already familiar with Padrino and just want to access reference materials, you may want to jump to our api docs or the guides homepage.

If you have any questions be sure to contact us at: @padrinorb, discuss things on google groups, join us on IRC at “#padrino” on freenode or open an issue on GitHub.


First Up, Why Learn Sinatra and Padrino?

A more detailed explanation of why you should take the time to learn Sinatra and Padrino is presented later, but let’s take a second to briefly enumerate three major advantages now:

Easy to Learn

The most interesting aspect of the Padrino stack (Rack, Sinatra, et al) in comparison to other web development tools is how modular and standalone each individual piece of the stack is. This makes learning each part much easier, and allows people to be productive right away, organically building up their knowledge of different aspects as they become necessary within a system. This concept of genuine graduated complexity within a web development stack is relatively unique to Sinatra and Padrino in the Ruby web world.

Fast

Sinatra and Padrino are very fast relative to other full stack frameworks. The Padrino stack is lightweight and slim which can be demonstrated in our performance benchmarks. While all benchmarks should be taken with a grain of salt, over the course of developing hundreds of applications, we have found that the memory usage, stability and requests per second speak for themselves.

Extensible

The other benefit of Sinatra and Padrino is the rich ecosystem of extensions that can be applied at any level of the stack. For rack, there is a wealth of middlewares that can help do almost anything. For Sinatra, there is also a large base of extensions to add most any functionality you might need. Best of all, these are all 100% compatible with Padrino, and using our Recipe Box and our use of Bundler, you can enable nearly any library or functionality you will need with a single command.


Getting to Know Ruby

A detailed overview of Ruby is beyond the scope of our documentation, but this guide is intended to point you in the right direction and get you familiarized with the important terms. The Padrino web framework is built in the Ruby programming language. The Padrino codebase is a set of modular libraries for Ruby which are packaged using RubyGems.

In order to use Ruby and Padrino, you need to install the Ruby interpreter onto your local machine and setup RubyGems so you can install ruby packages.

You should now be able to execute the following commands in the terminal:

$ ruby -v
$ gem -v
and these should return with version numbers and no errors if everything is installed correctly. Once you have Ruby and Rubygems installed locally, you should become familiar with the Ruby syntax. We recommend a few resources below to get yourself familiar with Ruby:

TryRuby – This is an interactive tutorial that takes you step by step through learning Ruby. This is highly recommended. Visit the site and type “help” to get started.
Learn to Program by Chris Pines – Excellent first Ruby tutorial, straightforward and excellent overview of the language.
Learn Ruby the Hard Way – Newest addition to the group, based off of Zed’s excellent Python tutorial. Set of exercises that teaches Ruby to you in a rigorous but simple approach.
Why’s Poignant Guide – Definitely the most unorthodox way to learn Ruby, but must be mentioned.
Through these guides, learning Ruby the language should be fairly painless and hopefully you come to appreciate the elegance and simplicity of the syntax. If you enjoy Ruby and want to continue, the next step is to get familiar with Sinatra, the ruby DSL for the web.


Learning to Love Sinatra

Padrino is a framework which builds on the existing functionality of the Sinatra Ruby web DSL and provides a variety of additional tools and helpers to extend this foundation. To use Padrino, one should be familiar with the basic usage of Sinatra itself.

First, let’s install Sinatra through RubyGems:

$ gem install sinatra
Thankfully, Sinatra is probably the easiest to learn tool for making web apps you have yet encountered. Here is an example of a Sinatra application:

# app.rb
require 'sinatra'
get '/hi' do
  "Hello World!"
end
and then you can start the application with this in your terminal:

$ ruby -rubygems hi.rb
== Sinatra has taken the stage ...
>> Listening on 0.0.0.0:4567
and then visit http://localhost:4567/hi in your web browser. It really is that easy, but there’s a lot more to learn!

Resources for Sinatra are listed below:

Sinatra Introduction
Sinatra Book
Sinatra Github Repo
There are several good Sinatra tutorials as well:

Just Do It, Learn Sinatra – Great step by step 3 part tutorial on Sinatra.
Singing with Sinatra – Excellent beginners guide to learning Sinatra.
TitusD Sinatra – Step by step beginners tutorial for Sinatra.
Sinatra Usage Examples – Great set of examples for how to use Sinatra in code snippets.
Read through these tutorials to understand routes, helpers, and the request/response cycle that is exposed through Sinatra. The most comprehensive resource is probably the Sinatra Book so make sure to skim through that and familiarize yourself with the concepts before continuing to Padrino.


Scalable Sinatra using Padrino

Once you have a solid understanding of Sinatra then you can also already understand the simplest functionality of Padrino. This is because Padrino acts as a super-set of Sinatra.

First, check out the Installation guide to get Padrino setup on your computer through RubyGems.

Padrino itself is a set of modular extensions for Sinatra. These extensions are actually fairly standalone and you can actually use many Padrino modules in your existing Sinatra apps through the Standalone Usage guide. This usage is intended for applications that have already been built that would benefit from a particular aspect of Padrino such as a mailer or view helpers. Check out our api docs for more information about the individual modules.

If you are able to convert your project to Padrino or start a new application from scratch, we recommend using the full Padrino stack which makes starting a new project much easier. The best way to get familiar with Padrino is to first check out the Blog Tutorial which takes you step by step through creating a blog in Padrino with an accompanying screencast. You may also want to checkout the Why Padrino guide to understand the benefits of using Padrino.

You should also take time to familiarize yourself with the various “components” Padrino allows you to use for your application. To make things simple, if you are new to the Ruby community and want to create a Padrino application with a good default set of components, generate your project with this command:

$ padrino g project my_project -d datamapper -t riot -s jquery -e haml -m mocha
And then read up on these components:

DataMapper – Great Object Relational Mapper for interacting with data
Haml – Solid templating choice for views
jQuery – Excellent javascript framework for frontend development
Riot – Popular unit testing framework for ruby
Mocha – Popular mocking and stubbing for tests
There are also a few important guides that cover the vast majority of Padrino’s functionality. These are definitely recommended reading:

Blog Tutorial – Step by step blog tutorial using Padrino
Generators – A reference guide for the generator and the various components
Project Types – Overview of the various project types
Application Helpers – A reference guide for the view helpers available
Controllers and Routing – An overview of the enhanced routing system
Delivering Mail – Overview of how to deliver mail in Padrino applications
Admin and Authentication – Admin dashboard and authentication system
Site Caching – Page and fragment caching system
Mounting Sub-applications – Explanation of the “application” mounting process
Development and Terminal Commands – Important notes about development
These guides should shed light on the various aspects that make Padrino helpful while developing Sinatra-based applications.


Extending Padrino Projects

As you being building real projects with Padrino, you will quickly require additional functionality not built into Padrino itself. Thankfully finding and using modular libraries that add additional functionality to your Sinatra and Padrino applications is quite painless.

In order to manage dependencies for a project, Padrino relies on another RubyGem called Bundler. A default Padrino Gemfile looks akin to this:

# Gemfile
source :rubygems

# Project requirements
gem 'rake'
gem 'sinatra-flash'
# Component requirements
# ...more gems...
gem 'padrino', '0.12.3'
All dependencies and libraries required for your project should be declared in the Bundler Gemfile which is generated automatically with every Padrino application. Once the dependencies have been declared, simply run

$ bundle install
which will resolve and install all the required libraries. Check out the Bundler documentation for more details about how this works.

The best extensions to look for are those that have already been included as “recipes” in our padrino-recipes repository. Any recipe included there represents a one command installation of the specified functionality. For instance, suppose you want to setup pagination in your application for a resource. Installing the will_paginate gem is as simple as applying the recipe:

$ padrino g plugin will_paginate
which will install that gem into your project (and Gemfile) automatically. If you can’t find a recipe in the Recipe Box then be sure to search for rack middlewares or sinatra compatible libraries to use in your app:

