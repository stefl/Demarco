Richard Demarco
===============

This is the source code that runs the site at http://demarco.heroku.com

It was built for the 2012 Culture Hack Scotland event as a way of opening up and making more accessible the work of photographer Richard Demarco.

Install instructions:

* Clone this repo
* Install MongoDB. On a mac, with homebrew `brew install mongodb`
* Install Memcached. Again `brew install memcached`
* Install gems: `bundle install`
* Start the server: `padrino s`

Without the data it's not much use, so once the data has stabilised I'll try to get a dump of the DB up on Amazon S3. 

For now, download the data from Sync and run:

    iconv -f windows-1252 -t utf8 /path/to/your.csv > /path/to/your.utf8.csv
    padrino console
    require 'csv'
    Image.from_csv "/path/to/your.utf8.csv"

This routine is a _bit_ out of date but you'll get the idea.