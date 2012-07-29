## Viziframe - Application framework using Ramaze with HAML option.

By Al Kivi

Email: al.kivi@vizitrax.com

### About

Viziframe is an application framework designed to support small applications built with Ramaze. This application supports both the Etanni and the Haml templates.

* Default layout in Haml supports all the screens
* Each screen has a standardized menu and left-bar and right-bar columns
* User access control mechanism is supported
* Blog application is included to demonstrate key functionaliy
* RSS feed (Atom based) generated from the blog posted information

### Requirements

* Ruby 1.8.7 or greater
* Sqlite 3.7.13

And the following Gems

* Ramaze 2012.04.14
* Sqlite3 1.3.6
* Sequel 3.37.0
* Rdiscount 1.6.8
* Haml 3.1.6 (optional)

### Get started in the Development Environment

* Install SQLite

* Install the required Gems
	* Refer to www.ramaze.net for installation instructions for Ramaze
	* Refer to www.haml.info for installation instructions for Haml
	* Refer to sequel.rubyforge.org for documentation on Sequel

---

* Download zip file from Github
* Extract into application directory (e.g., /apps)
* Use SQLite explorer create the 'database.db' in the /db sub-directory
* Load the 'database.db' using your SQLite administration tools
	* Load the tables and data from the extract file 'database.sql' in the /migrations sub-directory.

---

* Go to the /apps/viziframe sub-directory to start up the application
* Enter the following in the terminal command line > ramaze start

### Select the Haml template instead of Etanni

* Go to the the Controller init.rb and change the defined engine

    class BaseController < Ramaze::Controller
      layout :default
      helper :xhtml, :user, :paginate
      engine :etanni           # this can be changed to :haml, if required
    end

### Get started in the Production Environment (Passenger)

* Install SQLite

* Install the required Gems

* The app.rb module will look for the value in ENV['RACK_ENV']
	* If the value is nil, then a development environment is assumed
	* If the value is 'production', then it is a production environment. The conditional logic handles a Passenger environment, and makes appropriate adjustments to the Gem paths.
	* You may need to modify the add.rb code to reflect the requirements of your production environment.

### Demo Application

You can view a hosted version of the application at 'demo.vizitrax.com'.

### Thanks 

Yorick Peterse and Justkez for their applications that demonstrate the potential capabilities of Ramaze.
