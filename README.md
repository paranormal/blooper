# Welcome to blooper [![Code Climate](https://codeclimate.com/github/paranormal/blooper.png)](https://codeclimate.com/github/paranormal/blooper)

{Blooper}[http://www.mariowiki.com/Blooper] is squid-like creatures that are found in the ocean.
It can also write squid access log into a database (I believe any sequel-support database).
Should you write a squid access log into a data base, you won't have to catch a blooper in the ocean of errors for that.
I have already tamed one, and you are free to use it.

The idea is shamelessly stolen from {logmysqldaemon}[http://sourceforge.net/projects/logmysqldaemon/] script.

== Installation

    gem install (pg|mysql|oracle|sqlite|etc sequel database adapter)
    gem install blooper

== Squid configuration

    logformat squid_log time %{%Y-%m-%d_%H:%M:%S%z}tl time_response %tr ip_source %>a squid_request_status %Ss http_status_code %03>Hs http_reply_size %<st http_request_method %rm http_request_url %ru user_name %un squid_hier_code %Sh ip_destination %<a http_content_type %mt
    access_log daemon:{adapter:postgres,database:squid,username:squid,password:squid,host:db} squid_log
    logfile_daemon /usr/local/bin/blooper

1. The column names are dynamic, here time is a column name, {%{%Y-%m-%d_%H:%M:%S%z}}[http://www.squid-cache.org/Versions/v3/3.2/cfgman/logformat.html] is a value that will be written into that column.

2. The second string contains database access information, the credential depends on {adapter}[http://sequel.rubyforge.org/rdoc/files/doc/opening_databases_rdoc.html], tested only with postgres.

3. The third string is a full path to the executable ($ which blooper).

== Database configuration

    createdb squid
    psql squid < pg.schema

Or use your own schema integration, just specify the proper format into the logformat variable in squid.conf.
