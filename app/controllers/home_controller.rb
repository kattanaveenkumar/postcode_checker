# app/controllers/home_controller.rb
class HomeController < ApplicationController

  def index; end

  def check_post_code
    post_code = params[:postcode]
    if post_code.present?
      response = PostcodeValidator.new(post_code).call
      flash[:message] = response
    else
      flash[:message] = 'Post Code cannot be blank'
    end
    redirect_to root_url
  end
end
