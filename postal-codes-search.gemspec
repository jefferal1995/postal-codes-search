# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'postal-codes-search'

Gem::Specification.new do |s|
  s.name                  = 'postal-codes-search'
  s.version               = PostalCodesSearch::VERSION
  s.authors               = ['Jefferson Alvarez Alvarez']
  s.email                 = ['jeffersonalvarez95@hotmail.com']
  s.description           = 'Gem to get postal codes of US and CA with postal code or name'
  s.summary               = 'Gem to get the cities and countries for US and CA'
  s.homepage              = 'https://github.com/jefferal1995/postal-codes-search'
  s.license               = 'MIT'
  s.date                  = '2021-03-21'

  s.files                 = Dir['lib/**/*.rb', 'lib/**/*.yml', 'MIT-LICENSE', 'README.md']
  s.required_ruby_version = '>= 2.4.0'
  s.require_paths         = ['lib']
end
