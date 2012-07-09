# This module provides some basic methods with the Viziframe application.
#
# Author::    Al Kivi <al.kivi@vizitrax.com>
# License::   MIT
class MainController < BaseController

  def index
    @lwidth = '20%'
    @rwidth = '20%'  
    @title = 'Welcome to Viziframe!'
  end

  def about
    unless logged_in?
      flash[:message] = 'You must login first to see the requested page'
      redirect('users/login')
    end
    @lwidth = '0%'
    @rwidth = '20%'  
    @title = 'Welcome to the About page!'
  end

  # the string returned at the end of the function is used as the html body
  # if there is no template for the action. if there is a template, the string
  # is silently ignored
  def notemplate
    @title = 'Welcome to Viziframe!'
    
    return 'There is no \'notemplate.xhtml\' associated with this action.'
  end
end
