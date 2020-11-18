require 'incoterms/version'
require 'incoterms/base'
require 'incoterms/versions/2020'

module Incoterms


  INCOTERMS_ROOT_PATH = File.expand_path('..', File.dirname(__FILE__))
  VERSIONS_INCOTERMS = [2020].freeze

  # Incoterms version
  mattr_accessor :version

  # Data directory
  mattr_accessor :data_dir
  @@data_dir = [INCOTERMS_ROOT_PATH, 'data']

  class << self
    def all
      check_version
      class_incoterm = Object.const_get "Incoterms::V#{version}"
      class_incoterm.all
    end

    def load_data
      check_version
      datafile_path = datafile_path(["incoterms#{version}.json"])
      File.exist?(datafile_path) ? JSON.parse(File.binread(datafile_path), symbolize_names: true) : {}
    end

    def datafile_path(file_array)
      File.join([@@data_dir] + file_array)
    end

    def check_version
      if version
        begin
          temp_version = Integer(version)
        rescue StandardError
          raise 'Invalid value for define version incoterms'
        end

        unless VERSIONS_INCOTERMS.include?(temp_version)
          raise "Unsupported version incoterm. The suported versions are: #{VERSIONS_INCOTERMS.join(', ')}"
        end
      else
        raise 'You must define a version incoterms by default'
      end
    end

    def setup
      yield self
    end
  end
end



