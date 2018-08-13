# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'multi_table/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'multi_table'
  s.version     = MultiTable::VERSION
  s.authors     = ['Jason Rush']
  s.email       = ['diminish7@gmail.com']
  s.homepage    = 'https://github.com/diminish7/multi_table'
  s.summary     = 'Multi-Table Inheritance for Rails'
  s.description = 'A multi-table inheritance scheme for Rails/ActiveRecord that combines ' \
                  'Rails single-table inheritance with a polymorphic association.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.0'

  s.add_development_dependency 'byebug'
  s.add_development_dependency 'factory_bot_rails', '~> 4.10'
  s.add_development_dependency 'rspec-rails', '~> 3.8'
  s.add_development_dependency 'rubocop', '0.58.2'
  s.add_development_dependency 'shoulda-matchers', '~> 3.1'
  s.add_development_dependency 'sqlite3'
end
