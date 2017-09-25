class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
    def get_site
      @site = Site.friendly.find(params[:site_id])
    end
end
