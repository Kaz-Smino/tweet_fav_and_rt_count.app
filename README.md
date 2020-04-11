 ## IERA

 

- ~~URL: [http://iera.suminofu.com/](http://iera.suminofu.com/)~~
- ~~test user login information: Email: test1@yahoo.co.jp, Password: 111111~~

 ## concept
This is a service that disseminates information for people who are new to programming or are changing jobs in the web industry.

 ## Overview
It retrieves the timeline of the list of Twitter users (mainly active engineers), and displays them in order of the total number of retweets and favorites from the tweets of the last week.

 ## Feature List
- user registration function
- user authentication function
- pagination function

 ## List of technologies used
- HTML/CSS, Bootstrap, jQuery
- Ruby on Rails
- DB:[MySQL+Docker]
- Heroku
- WebAPI: Twitter API

## setting(Docker+MySQL)

In the development environment, create a `.env` file. The values defined in the `.env` file are read as environment variables.
```
$ cp .env_sample .env
```
You can launch MySQL in Docker. The default is to start on port 43006.
```
$ ./bin/create_db
```
If you already have a container, you can force its creation with the `-f` option.
```
$ ./bin/create_db -f
```

## setting(Heroku Scheduler)
In Heroku Scheduler([https://devcenter.heroku.com/articles/scheduler](https://devcenter.heroku.com/articles/scheduler))
Please set the Rake task ([mysql.rake](https://github.com/suminofu0829/tweet_fav_and_rt_count.app/blob/master/lib/tasks/mysql.rake "mysql.rake")) to be processed in batch every 10 minutes.

Add a new tweet to the DB
```
$ ./bin/rake mysql:add_data
```
Update DB registered tweet information (total number of favorites and RTs, etc.)
```
$ ./bin/rake mysql:update_data
```


## License

This software is released under the MIT license; see LICENSE.
