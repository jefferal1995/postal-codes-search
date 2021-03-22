# Postal Codes Search [![Gem Version](https://badge.fury.io/rb/postal-codes-search.png)](http://badge.fury.io/rb/postal-codes-search)

Gem to obtain postal codes for US and CA only.

## Installation

Add this line to your application's Gemfile:

    gem 'postal-codes-search'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install postal-codes-search

## Usage

```ruby
PostalCodesSearch.find('Y1A')
# => [{"country"=>"CA", "postal_code"=>"Y1A", "city"=>"Whitehorse", "state"=>"Yukon", "county"=>nil}]
# First run will take a while, as the yaml has to be loaded
```

Using rails, you can load all the values in a initializer
```ruby
# config/initializers/load_zip_codes.rb
PostalCodesSearch.load unless Rails.env.development?
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request