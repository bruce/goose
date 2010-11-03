Goose
=====

Goose is a navigation plugin for Rails whose aim it is to make adding
smart, context-aware navigation to your application as easy as
possible.

Installing it
-------------

First of all, install it with bundler.

In your `Gemfile`:

    gem 'goose'

Then:

    $ bundle install

Now, install the Goose configuration:

    $ rails generate goose:install

Adding your navigation
----------------------

Create a partial for each navigation menu in the [now present]
`app/views/nav` directory.  You can have as many as you like.

We add one in `app/views/nav/_main.html.erb`:

    <nav>
      <ul>
      </ul>
    </nav>

You'll notice this example uses HTML5 `<nav>` tags.  You don't have to
(but you probably should).

In your `<ul>`, use `nav_to` in place of your `<li>`s.  `nav_to` is
invoked the same way as the `link_to` helper you already know and love:

    <nav>
      <ul>
        <%= nav_to 'People', people_path %>
        <%= nav_to 'Places', places_path %>
        <%= nav_to 'Things', things_path %>
      </ul>
    </nav>

Now, in each action template, just tell Goose where you are.

    <%= nav_at 'People' %>

By default, Goose guesses your location is in reference to a `"main"`
nav.  You can tell it to use something else easily enough; for
instance, if we also had a `app/views/nav/_people.html.erb` that we
were using as secondary navigation:

    <%= nav_at 'Address Information', in: 'people' %>

The navigation partial will be inserted (as you might expect), exactly
where you put your `nav_at`.  If you want to place your navigation
somewhere else (as you probably want to do with your main navigation),
just wrap your navigation partial in a `content_for`:

    <% content_for :main_navigation do %>
      <nav>
        <ul>
          <%= nav_to 'People', people_path %>
          <%= nav_to 'Places', places_path %>
          <%= nav_to 'Things', things_path %>
        </ul>
      </nav>
    <% end %>

And use `yield` wherever it makes sense in your layout:

    <!DOCTYPE html>
    <html>
      ...
      <header>
        <h1>Great balls of fire!</h1>
        <%= yield :main_navigation %>
      </header>
      ...
    </html>

It's that simple.

Customizing Goose
-----------------

See `config/initializers/goose.rb` for options.

Copyright
---------

Copyright (c) 2010 Bruce Williams. See LICENSE for details.
