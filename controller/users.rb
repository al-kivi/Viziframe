# This module is class for user authentication for Ramaze applications.
#
# Author:: www.justkez.com  -  License:: n/a

class Users < BaseController
  map '/users'
  
  layout :default
  helper :xhtml, :user, :paginate
  engine :haml
  
  # Shows an overview of all the users that have been added to the database.
  def index
    @lwidth = '0%'
    @rwidth = '20%'
    @users = paginate(User, :limit => 10)
    @title = 'Users'
  end
  
  def delete(id)
    begin
      User.filter(:id => id).destroy
      flash[:success] = 'The specified user has been removed'
    rescue => e
      Ramaze::Log.error(e.message)
      flash[:error] = 'The specified user could not be removed'
    end
    redirect(Users.r(:index))
  end

  def login
    @lwidth = '0%'
    @rwidth = '20%'
    @title = 'Login'
    session[:email] = 'xxx'
    redirect_referer if logged_in?
    return unless request.post?
    user_login(request.subset(:email, :password))
    if logged_in?
      flash[:message] = 'Login successful'
      session[:email] = request[:email]
      redirect('/')
    else
      flash[:message] = 'Login failed. Please try again'
      redirect('users/login')
    end
  end

  def register
    @lwidth = '0%'
    @rwidth = '20%'
    @title = 'Register for an account'
    if request.post?
      redirect('/') if request.params['cancel'] == "Cancel"
      if request[:password] != request[:password_confirmation]
        flash[:message] = 'Password and confirmation do not match'
        redirect('users/register')
      end
      @user = User.new
      @user[:email] = request[:email]
      @user.password = request[:password]
      @user.password_confirmation = 
      @user.salt = Digest::SHA1.hexdigest("--#{Time.now.to_f}--#{user.email}--")
      @user[:username] = request[:username]
      @user.raise_on_save_failure = false   # this is needed 
      if @user.save
        flash[:message] = 'Account created, feel free to login below'
        redirect('users/login')
      else
        flash[:message] = @user.errors.values[0]
      end
    end
  end 

  def logout
    flash[:message] = "Logged out"
    user_logout
    redirect('/')
  end
  
  def loginfailed
    @lwidth = '0%'
    @rwidth = '20%'
    flash[:message] = 'Login not accepted. User is not yet registered'
  end
end # Users
