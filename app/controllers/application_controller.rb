# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper

  def render_404(e = nil)
    logger.info "Rendering 404 with exception: #{e.message}" if e
    render file: Rails.root.join("public/404.html"), status: 404, layout: false, content_type: "text/html"
  end

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
    end
  end
end
