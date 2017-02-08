class WelcomeController < ApplicationController

  def home
    @message = "yo welcome to binging and budging!"
    @guidebox = HTTParty.get("http://api-public.guidebox.com/v2/movies?api_key=#{ENV['GUIDEBOXWRAPPER_API_KEY']}&limit=15")
    puts "CHECK", @guidebox.inspect



  end


end
