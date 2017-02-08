class MoviesController < ApplicationController
require 'uri'
# serialize(:free_web_sources, Array)
    def index
      @movies = Movie.all
      @user = User.find(current_user.id)
      @saved = @user.movies
    end

    def search_results

      #search params
        @searching = params[:search]
      if current_user != nil
      #this is to get limit of 10 movies
        @guidebox = HTTParty.get("https://api-public.guidebox.com/v2/movies?api_key=#{ENV['GUIDEBOXWRAPPER_API_KEY']}&limit=10")
          if @searching != nil
              @search = URI.encode(@searching)
      #this is get the searched movie results
        @guidebox_movie = HTTParty.get("https://api-public.guidebox.com/v1.43/all/#{ENV['GUIDEBOXWRAPPER_API_KEY']}/search/movie/title/#{@search}/fuzzy/web")
        # render :json => @guidebox_movie
        @movieslist = @guidebox['results']
        @moviesearch = @guidebox_movie['results']
          else
             redirect_to url_for(:controller => :movies, :action => :search_results)
           end
      else
        @searching = params[:search]
        @search = URI.encode(@searching)
        @guidebox_movie = HTTParty.get("https://api-public.guidebox.com/v1.43/all/#{ENV['GUIDEBOXWRAPPER_API_KEY']}/search/movie/title/#{@search}/fuzzy/web")
        @moviesearch = @guidebox_movie['results']
      end
    end

    def one_result
      puts "CHECK ALLO ", params.inspect
      @movie_id = params[:movie_id]
      @trailer= HTTParty.get("https://api-public.guidebox.com/v2/movies/#{@movie_id}?api_key=#{ENV['GUIDEBOXWRAPPER_API_KEY']}")

      puts "https://api-public.guidebox.com/v2/movies/#{@movie_id}?api_key=#{ENV['GUIDEBOXWRAPPER_API_KEY']}"

      # render :json  => @trailer
      puts "TRAILER", @trailer
    end

    def create
      @new_movie = Movie.new(
         title: params[:title],
         genre: params[:genre].to_i,
         time: params[:duration],
         user_id: params[:user_id],
         writers: params[:writers],
         movie_id: params[:movie_id],
         release_year: params[:release_year],
         directors: params[:directors],
         rottentomatoes: params[:rottentomatoes],
         web_trailers: params[:web_trailers],
         posters: params[:posters],
         metacritic_link: params[:metacritic_link],
         free_web_sources: params[:free_web_sources],
         thumbnails: params[:thumbnails],
         banners: params[:banners],
         overview: params[:overview],
         purchase_web_sources: params[:purchase_web_sources],
         tv_everywhere_web_sources: params[:tv_everywhere_web_sources],
         search: params[:search]
          )
      @new_movie.save
      puts "New Movie", @new_movie.inspect
    end

    # def show
    # end

    def edit
    end

    def update

    end

    def destroy
      Movie.delete(params[:id])
      redirect_to url_for(:controller => :movies, :action => :index)
    end



end
