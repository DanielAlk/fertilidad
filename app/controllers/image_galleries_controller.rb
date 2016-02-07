class ImageGalleriesController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show, :show_item]
  before_action :set_image_gallery, only: [:show, :edit, :update, :destroy, :update_items, :preview_items]
  before_action :set_image_gallery_item, only: [:show_item, :destroy_item]
  before_action :get_schedules, only: [:index, :show, :preview_items]
  layout 'admin', only: [:new, :edit]

  # GET /image_galleries
  # GET /image_galleries.json
  def index
    @image_galleries = ImageGallery.all
  end

  # GET /image_galleries/1
  # GET /image_galleries/1.json
  def show
  end

  # GET /image_galleries/new
  def new
    @image_gallery = ImageGallery.new
  end

  # GET /image_galleries/1/edit
  def edit
  end

  # POST /image_galleries
  # POST /image_galleries.json
  def create
    @image_gallery = ImageGallery.new(image_gallery_params)

    respond_to do |format|
      if @image_gallery.save
        save_images
        format.html { redirect_to @image_gallery, notice: 'Image gallery was successfully created.' }
        format.json { render :show, status: :created, location: @image_gallery }
      else
        format.html { render :new }
        format.json { render json: @image_gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /image_galleries/1
  # PATCH/PUT /image_galleries/1.json
  def update
    respond_to do |format|
      if @image_gallery.update(image_gallery_params)
        save_images
        format.html { redirect_to @image_gallery, notice: 'Image gallery was successfully updated.' }
        format.json { render :show, status: :ok, location: @image_gallery }
      else
        format.html { render :edit }
        format.json { render json: @image_gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_galleries/1
  # DELETE /image_galleries/1.json
  def destroy
    @image_gallery.destroy
    respond_to do |format|
      format.html { redirect_to image_galleries_url, notice: 'Image gallery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_item
  end

  def update_items
    params['items'].each do |item|
      gallery_item = ImageGalleryItem.find(item['id'])
      gallery_item.update(title: item['title'], text: item['text'])
    end
    redirect_to @image_gallery, notice: 'Image gallery was successfully updated.'
  end

  def destroy_item
    @image_gallery_item.destroy
    respond_to do |format|
      format.html { redirect_to @image_gallery, notice: 'Gallery item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def preview_items
    @show_as_regular_user = true;
    render :show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_gallery
      @image_gallery = ImageGallery.friendly.find(params[:id] || params[:image_gallery_id])
    end

    def set_image_gallery_item
      @image_gallery_item = ImageGalleryItem.find(params[:id] || params[:image_gallery_item_id])
      @image_gallery = @image_gallery_item.image_gallery
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_gallery_params
      params.require(:image_gallery).permit(:title)
    end

    def save_images
      if params['gallery_images'].present?
        params['gallery_images'].each do |image|
          @image_gallery.items.create(title: image.original_filename,image: image)
        end
      end
    end
end
