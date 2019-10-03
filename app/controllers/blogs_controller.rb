class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :admin_only, except: [:index, :show]

  # GET /blogs
  # GET /blogs.json
  def index
    if params[:tag]
      @tagged_blogs = Blog.tagged_with(params[:tag])
    else
      @tagged_blogs = []
    end
    @blogs = Blog.where(published: true, big_feature: false, featured: false, most_popular: false).order("published_at DESC")
    @published_blogs = Blog.where(published: true).order("published_at DESC")
    @drafts = Blog.where(published: false)
    @big_feature = Blog.where(big_feature: true, published: true).limit(1)
    @featured = Blog.where(featured: true, published: true).limit(3)
    @most_popular = Blog.where(most_popular: true, published: true).limit(3)
    @recent = Blog.where(published: true, big_feature: false, most_popular: false, featured: false).order("published_at DESC")
    respond_to do |format|
      format.html
      format.rss { render :layout => false }
    end
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)
    @blog.spree_user_id = spree_current_user.id

    respond_to do |format|
      if @blog.save!
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def tagged
    if params[:tag].present?
      @blogs = Blog.tagged_with(params[:tag])
    else
      @blogs = Blog.all
    end
  end

  def admin_only
    unless current_spree_user && current_spree_user.admin?
      redirect_back(fallback_location: root_path)
      flash[:warning] = "Sorry, you must be an administrator to access that page."
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(
        :title,
        :teaser,
        :body,
        :published,
        :published_at,
        :featured_image_url,
        :user_id,
        :pin_1_url,
        :pin_2_url,
        :pin_3_url,
        :pin_4_url,
        :big_feature,
        :featured,
        :most_popular,
        :tag_list
      )
    end
end
