require File.expand_path('../lib/attribution/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name    = 'attribution'
  spec.version = Attribution::VERSION
  spec.files   = Dir.glob('**/*')
  spec.require_paths = ['lib']
  spec.summary = 'Attribution analytics library'
  spec.description = 'The attributionapp.com ruby analytics library'
  spec.authors = ['attributionapp.com']
  spec.email = 'support@attributionapp.com'
  spec.homepage = 'https://github.com/attribution/attribution-ruby'
  spec.license = 'MIT'

  # Ruby 1.8 requires json
  spec.add_dependency 'json', ['~> 1.7'] if RUBY_VERSION < "1.9"

  spec.add_development_dependency 'rspec', '~> 2.0'
  spec.add_development_dependency 'webmock', '~> 1.13'
end
