# Define a subclass of Ramaze::Controller holding your defaults for all controllers. Note 
# that these changes can be overwritten in sub controllers by simply calling the method 
# but with a different value.

class BaseController < Ramaze::Controller
  layout :default
  helper :xhtml, :user, :paginate
  engine :etanni                # this can be changed to :haml, if required
end

# Here you can require all your other controllers. Note that if you have multiple
# controllers you might want to do something like the following:
#
#  Dir.glob('controller/*.rb').each do |controller|
#    require(controller)
#  end
#
require __DIR__('main')
require __DIR__('users')
require __DIR__('posts')
require __DIR__('rssfeeds')
