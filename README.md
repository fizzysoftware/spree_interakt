SpreeInterakt
=============

spree_interakt extension allows you to integrate your spreecommerce application to Interakt.
visit http://interakt.co for more details.

Prerequisite
------------

```shell
1) Account in Interakt (You can start for free)
2) Project in Interakt to which the Data needs to be imported.
```

Note:

```shell
Your APP_ID and API_KEY are specific to interakt Project, and can be found here:
http://interakt.co/projects/XXXXXXXXXXXXX/api_info in Settings > API Information Page.
```

Installation
------------

Add spree_interakt to your Gemfile:

```ruby
gem 'spree_interakt'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_interakt:install APP_ID API_KEY
```

Integrate with Interakt

```shell
RAILS_ENV=production rake interakt:start
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_interakt/factories'
```

Copyright (c) 2013 [name of extension creator], released under the New BSD License
