class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  #エラーをハンドリングする
  unless Rails.env.development?
    rescue_from Exception,                        with: :_render_500
    rescue_from ActiveRecord::RecordNotFound,     with: :_render_404
    rescue_from ActionController::RoutingError,   with: :_render_404
  end
  

  #サイト取得メソッド
  def get_site
    @site = Site.friendly.find(params[:site_id])
  end
  
  #エラーハンドリング - Start
    def routing_error
      raise ActionController::RoutingError, params[:path]
    end

    private
    def _render_404(e = nil)
      logger.info "Rendering 404 with exception: #{e.message} \n #{e.backtrace.join("\n")}" if e
      render 'errors/error_404', status: :not_found, layout: false
    end
    
    def _render_500(e = nil)
      logger.error "Rendering 500 with exception: #{e.message}" if e
      render 'errors/error_500', status: :internal_server_error, layout: false
    end
  #エラーハンドリング - End
  
end
