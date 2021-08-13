require 'json'
require 'open-uri'

desc "Download and update movie database"
task :update_movies => :environment do
  movie_export_url = "http://files.tmdb.org/p/exports/movie_ids_07_11_2021.json.gz"
  movie_export = open(movie_export_url)

  columns = [ :title, :popularity, :adult, :uid ]
  values = []

  movies = Zlib::GzipReader.new(movie_export)
  movies.each_line do |line|
    data = JSON.parse(line)
    values << [data["original_title"],data["popularity"],data["adult"],data["uid"]]
   	#puts "#{data["original_title"]} #{data["adult"]}"
    #movie = Movie.find_or_initialize_by(uid: data["id"].to_i)
    #movie.title = data["original_title"].to_s
    #movie.popularity = data["popularity"].to_f
    #movie.adult = data["adult"]=="false" ? :false : :true
    #movie.save!
  end
  Movie.import columns, values, on_duplicate_key_ignore: true
end
