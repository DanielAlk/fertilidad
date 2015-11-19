class StaticPagesController < ApplicationController
  
  def home
    @image_galleries = ImageGallery.take(8)
  end

  def institutional
  end
  
  def images
  end
  
  def instructional
  end
  
  def spermogram
  end
  
  def insemination
  end
  
  def contact
  end
  
  def downloads
  end

end
