# frozen_string_literal: true

require 'yaml'

# Class module that handles all searching methods for postal codes
module PostalCodesSearch
  VERSION = '1.1'

  class << self
    SUPPORTED_COUNTRIES = %i[us ca].freeze

    def attribute_present(attr)
      !(attr.nil? || attr.empty?)
    end

    def selectable?(term, value)
      attribute_present(term) && value && value.to_s.downcase.include?(term.to_s.downcase)
    end

    def find_by(code: nil, country: nil, county: nil, city: nil, state: nil)
      data_source.select do |postal_code|
        selectable?(code, postal_code['postal_code']) ||
          selectable?(country, postal_code['country']) ||
          selectable?(county, postal_code['county']) ||
          selectable?(city, postal_code['city']) ||
          selectable?(state, postal_code['state'])
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
