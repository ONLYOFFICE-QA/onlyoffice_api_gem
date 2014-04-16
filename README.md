# Teamlab

Ruby Framework to interact with TeamLab API 2.0

## Installation

Add this line to your application's Gemfile:

    gem 'teamlab'

And then execute:

    bundle

Or install it yourself as:

    gem install teamlab

## Usage

First of all, you should configure your enviroment by commands

    Teamlab.configure do |config|
      config.server = 'example.teamlab.com'
      config.username = 'foo'
      config.password = 'bar'
    end

and then call methods you need:

    Teamlab.people.get_people


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## Documentation

If you have some questions, you can read original [documentation](http://api.teamlab.com/2.0/) for TeamLab API