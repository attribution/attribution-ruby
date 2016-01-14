ENV['RACK_ENV'] ||= 'test'

require 'rspec'
require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)

require './lib/attribution'
