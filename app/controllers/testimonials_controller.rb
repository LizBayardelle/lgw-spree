class TestimonialsController < ApplicationController
  before_action :set_testimonial, only: [:edit, :update, :destroy]
  before_action :admin_only, only: [:edit, :update, :destroy]


  def index
    @testimonials = Testimonial.all
  end


  def new
    @testimonial = Testimonial.new
  end


  def edit
  end


  def create
    @testimonial = Testimonial.new(testimonial_params)

    respond_to do |format|
      if @testimonial.save
        if params[:testimonial][:photo].present?
          @testimonial.photo.purge
          @testimonial.photo.attach(params[:testimonial][:photo])
        end
        format.html { redirect_to root_path, notice: 'Thanks for leaving a testimonial!  We are so grateful for customers like you.' }
        format.json { render :show, status: :created, location: @testimonial }
      else
        format.html { render :new }
        format.json { render json: @testimonial.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @testimonial.update(testimonial_params)
        if params[:testimonial][:photo].present?
          @testimonial.photo.purge
          @testimonial.photo.attach(params[:testimonial][:photo])
        end
        format.html { redirect_to admin_testimonials_path, notice: 'Testimonial was successfully updated.' }
        format.json { render :show, status: :ok, location: @testimonial }
      else
        format.html { render :edit }
        format.json { render json: @testimonial.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @testimonial.destroy
    respond_to do |format|
      format.html { redirect_to testimonials_url, notice: 'Testimonial was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

    def set_testimonial
      @testimonial = Testimonial.find(params[:id])
    end


    def testimonial_params
      params.require(:testimonial).permit(
        :title,
        :description,
        :image,

        :airblades,
        :fans,
        :vacuums,
        :lighting,
        :accessories,

        :homepage,
        :category_pages,
        :testimonials
      )
    end
end
