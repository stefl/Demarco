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

Licence
-------

Standard MIT licence follows...

Copyright (C) 2012 More Monsters Ltd.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.