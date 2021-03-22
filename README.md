# Postal Codes Search [![Gem Version](https://badge.fury.io/rb/postal-codes-search.png)](http://badge.fury.io/rb/postal-codes-search)

Gem to obtain postal codes for US and CA only.

## Installation

Add this line to your application's Gemfile:

    gem 'postal-codes-search', '~> 1.0', '>= 1.0.1'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install postal-codes-search

## Usage

You can search generally by any keyword like country, county, postal code, state and or city like this
```ruby
PostalCodesSearch.find('Y1A')
# => [{"country"=>"CA", "postal_code"=>"Y1A", "city"=>"Whitehorse", "state"=>"Yukon", "county"=>nil}]
# This will return an array. If you put an incomplete postal code, it will return the most similar results
```
You can use more specific search depending on the attribute you want to use

### By code
```ruby
PostalCodesSearch.find_by(code: 'Y1A')
# => [{"country"=>"CA", "postal_code"=>"Y1A", "city"=>"Whitehorse", "state"=>"Yukon", "county"=>nil}]
```

### By country
```ruby
PostalCodesSearch.find_by(country: 'US').count
# => 41469
```

### By county
```ruby
PostalCodesSearch.find_by(county: 'Yukon-Koyukuk').first
# => {"country"=>"US", "postal_code"=>99558, "city"=>"Anvik", "state"=>"Alaska", "county"=>"Yukon-Koyukuk (CA)"}
```

### By state
```ruby
PostalCodesSearch.find_by(state: 'Alaska').count
# => 273
```

### By city
```ruby
PostalCodesSearch.find_by(city: 'Venetie')
# => [{"country"=>"US", "postal_code"=>99781, "city"=>"Venetie", "state"=>"Alaska", "county"=>"Yukon-Koyukuk (CA)"}]
```

Using rails, you can load all the values in a initializer
```ruby
# config/initializers/postal_codes.rb
PostalCodesSearch.load unless Rails.env.development?
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request