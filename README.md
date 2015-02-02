# nara-ruby

A Ruby client for the [National Archives API](https://github.com/usnationalarchives/Catalog-API).

## Installation

Via bundler. Add this to your Gemfile:

  gem "nara-ruby"

Then execute:

  $ bundle

Or install it yourself:

  $ gem install nara-ruby

## Usage

There are many options and search criteria that can be used. The best way to learn about them is by exploring the [interactive documentation](https://catalog.archives.gov/interactivedocumentation) and other [provided documentation](https://github.com/usnationalarchives/Catalog-API/blob/master/search_and_export.md). The basic usage is as follows.

Search for a record by keyword using pagination:

```ruby
  require 'nara-ruby'

  Nara::Records.search({q: 'Nixon', rows: 10, offset: 20 })
```

Or search for a record by a specific naId:

```ruby
  require 'nara-ruby'

  Nara::Records.search({naIds: 574067 })
```

## TODO

A lot. Tests. Write capabilities for tagging and transcriptions. Authentication. More I'm sure. 

## Contributing

Pull requests please.

## Copyright

Written by David Naffis. See LICENSE.txt for further details.

