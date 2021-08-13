module MoviedbApiServices
  class GetMovieServices
    require 'httparty'

    def initialize(uid)
      @uid = uid
    end

    def call
      result = HTTParty.get("https://api.themoviedb.org/3/movie/#{@uid}?api_key=dc5d975c464b3a6c75a4925da909c70b")
    rescue HTTParty::Error => e
      OpenStruct.new({success?: false, error: e})
    else
      OpenStruct.new({success?: true, payload: result})
    end

  end
end
