class NewsController < ApplicationController
  def index
    @image_url = '/upload/front-home.jpg'
    @news = News.find(:all, :order => 'created_at desc')
  end
  
  def show
    @image_url = '/upload/front-comunicazioni.jpg'
    @news = News.find(params[:id])
  end
  
  def new
    @news = News.new
    if request.post?
      @news.attributes = params[:news]
      if @news.save
        redirect_to :action => 'show', :id => @news.id
      end
    end
  end
end