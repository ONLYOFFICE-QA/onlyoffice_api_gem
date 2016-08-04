# ONLYOFFICE API gem

Ruby Framework to interact with ONLYOFFICE API

## Installation

Add this line to your application's Gemfile:

    gem 'onlyoffice_api'

And then execute:

    bundle

Or install it yourself as:

    gem install onlyoffice_api

## Usage

First of all, you should configure your enviroment by commands

    OnlyOfficeApi.configure do |config|
      config.server = 'https://example.onlyoffice.com'
      config.username = 'foo'
      config.password = 'bar'
    end

and then call methods you need:

    OnlyOfficeApi.people.get_people


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## Documentation

Please read ONLYOFFICE API [documentation](https://api.onlyoffice.com/) for more information about API methods

## Project Information

Official website: [http://www.onlyoffice.org](http://onlyoffice.org "http://www.onlyoffice.org")

Code repository: [https://github.com/ONLYOFFICE/onlyoffice_api_gem](https://github.com/ONLYOFFICE/onlyoffice_api_gem "https://github.com/ONLYOFFICE/onlyoffice_api_gem")

SaaS version: [http://www.onlyoffice.com](http://www.onlyoffice.com "http://www.onlyoffice.com")

## License

onlyoffice_api_gem is released under an GNU AGPL v3.0 license. See the LICENSE file for more information.
