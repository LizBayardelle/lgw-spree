class HomeController < ApplicationController

  def index
    @testimonials = Testimonial.where(homepage: true)
  end

end
