class StaticPagesController < ApplicationController
  before_action :get_schedules, except: [:institutional, :contact]
  
  def home
    @image_galleries = ImageGallery.take(8)
  end

  def institutional
  end
  
  def spermogram
  end
  
  def insemination
  end
  
  def contact
  end

end
