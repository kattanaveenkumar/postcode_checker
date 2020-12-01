# app/controllers/home_controller.rb
class HomeController < ApplicationController

  def index; end

  def check_post_code
    flash[:message] = PostcodeValidator.new(params[:postcode]).call
    redirect_to root_url
  end
end
