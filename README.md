# README

The general approach in the project is to get the daily Movies DB dump provided by the Movies Service, then import this dump into DB to have a minimal searchable DB with the title/popularity values locally. This rake task currently as a hardcoded dump date, its encoded in the URL http://files.tmdb.org/p/exports/movie_ids_07_11_2021.json.gz, but we can change this to a more flexible approach, like the day before, or passing params to the rake task, or an admin console to manage it.

Then we use the UID stored of the movies in the api request to get the details of the particular movie, using the Movie API, currently we just return this JSON response, but we can create a separate table like, movie_data, to store this response as they are likely no to change over time, data of actors, directors, etc. The “popularity” may change, but we update that value in the main local movie DB, the frequency of this update has to be analyzed if we do it daily or weekly. We can even store that information in a separate table as well, to have historical data about the popularity of the movies in time, see movies that are gaining popularity, top gainers, top loosers, etc.

All the API endpoints requested are implemented and functional, the search is very basic, and can be also scaled later to meet a more demanding service, using Elastic would be a good choice for this, as we currently only search titles, we can later use other criterias as well.


Things you may want to cover:

* Ruby version: 2.6.6

* System dependencies: Currently none

* Configuration: We need an API key for the Movies DB, but one is provided.

* Database creation: Normal Rails DB init

* Database initialization: I have provided a rake task that download a daily DB dump to create the database. "rake update_movies"

* How to run the test suite: We use Rspec

* Services (job queues, cache servers, search engines, etc.): Currently none required

* Deployment instructions: Jut clone the repo and run the DB setup and rake task provided

