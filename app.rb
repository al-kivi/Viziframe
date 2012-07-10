# This file contains your application, it requires dependencies and necessary parts of 
# the application.
#
# It will be required from either `config.ru` or `start.rb`

require 'rubygems'

if ENV['HOSTNAME'].nil?
  require 'ramaze'
  Ramaze.options.mode = :dev
else
  #needed to avoid the Passenger exception page every hour or so
  Gem.clear_paths
  #use my own gem when available
  Gem.path.unshift('/home/vizitrax/.gems')
  require 'ramaze'
  Ramaze.options.mode = :live
end

require 'sequel'

# Make sure that Ramaze knows where you are
Ramaze.options.roots = [__DIR__]

# Initialize controllers and models
require __DIR__('model/init')
require __DIR__('controller/init')
