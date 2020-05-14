class AdminController < ApplicationController
  before_action :admin_only

  def testimonials
    @testimonials = Testimonial.all
  end

  def blogs
    @blogs = Blog.all
  end

  def management
  end
end
