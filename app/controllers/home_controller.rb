class HomeController < ApplicationController
  def index
  end 

  def search
    picture_name = params[:search]
    @picture = Picture.where('title like ?', picture_name).first
    if !@picture.nil?
      redirect_to @picture
    else
      flash[:notice] = 'No picture found with that name'
    end
  end
end
