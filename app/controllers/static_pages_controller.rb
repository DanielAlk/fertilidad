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
    @article_pages = (Article.count / ITEMS_PER_PAGE.to_f).ceil
    @articles = Article.order(id: 'desc').limit(ITEMS_PER_PAGE)
  end

  def news_page
    page = params[:page]
    @articles = Article.order(id: 'desc').limit(ITEMS_PER_PAGE).offset(ITEMS_PER_PAGE * page.to_i)
    render @articles
  end
  
  def contact
  end

  private
    ITEMS_PER_PAGE = 2

end
