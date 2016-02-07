class StaticPagesController < ApplicationController
  before_action :get_schedules, except: [:contact]
  
  def home
    @image_galleries = ImageGallery.take(8)
  end

  def institutional
  end
  
  def information
  end
  
  def services
  end
  
  def news
  end
  
  def contact
  end

end
