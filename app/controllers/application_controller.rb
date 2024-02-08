class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  before_action :ransack_search_params

  private

  def ransack_search_params
    @q = Post.ransack(params[:q])
  end
  
  def not_found
    render file: Rails.public_path.join('404.html'),status: 404, layout: false
  end
end
