## Viziframe - Application framework using Ramaze and HAML

By Al Kivi

Email: al.kivi@vizitrax.com

### About

Viziframe is an application framework designed to support small applications built with Ramaze and Haml.

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
* Haml 3.1.6
* Sequel 3.36.1

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

### Get started in the Production Environment (Passenger)

* Install SQLite

* Install the required Gems

* The app.rb module will look for a production hostname in ENV['HOSTNAME']
	* If the hostname is nil, then a development environment is assumed
	* If the hostname is not nil, then a production (:live) environment is assumed. The conditional logic handles a Passenger environment, and makes appropriate adjustments to the Gem paths.
	* You may need to modify the add.rb code to reflect the requirements of your production environment.

### Demo Application

You can view a hosted version of the application at 'demo.vizitrax.com'.

### Thanks 

Yorick Peterse and Justkez for their applications that demonstrate the potential capabilities of Ramaze.
