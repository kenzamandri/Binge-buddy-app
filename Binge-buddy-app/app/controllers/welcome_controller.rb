class WelcomeController < ApplicationController

  def home
    @message = "yo welcome to binging and budging!"
    @guidebox = HTTParty.get("http://api-public.guidebox.com/v2/movies?api_key=1073aa1531332a551d5f99e3fc2db260fd04159f%20&limit=15")
    puts "CHECK", @guidebox.inspect



  end


end
