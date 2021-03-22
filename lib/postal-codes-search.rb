# frozen_string_literal: true

require 'yaml'

# Class module that handles all searching methods for postal codes
module PostalCodesSearch
  VERSION = '1.0.1'

  class << self
    SUPPORTED_COUNTRIES = %i[us ca].freeze

    def attribute_present(attr)
      !(attr.nil? || attr.empty?)
    end

    def find_by(code: nil, country:  nil, county: nil, city: nil, state: nil)
      data_source.select do |postal_code|
        (attribute_present(code) && postal_code['postal_code'] && postal_code['postal_code'].to_s.include?(code)) ||
          (attribute_present(country) && postal_code['country'] && postal_code['country'].to_s.include?(country)) ||
          (attribute_present(county) && postal_code['county'] && postal_code['county'].to_s.include?(county)) ||
          (attribute_present(city) && postal_code['city'] && postal_code['city'].to_s.include?(city)) ||
          (attribute_present(state) && postal_code['state'] && postal_code['state'].to_s.include?(state))
      end
    end

    def find(term)
      term = term.to_s
      find_by(code: term, country: term, county: term, city: term, state: term)
    end

    def data
      data = []
      current_path = File.dirname(__FILE__)
      SUPPORTED_COUNTRIES.each do |country_code|
        data_path = File.join(current_path, 'source', "#{country_code}_postal_codes.yml")
        country_data = YAML.safe_load(File.open(data_path))

        data += country_data
      end
      data
    end

    def data_source
      @data_source ||= begin
        data
      end
    end

    def load
      data_source
    end
  end
end
