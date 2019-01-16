class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
 
  def index
    @pictures = Picture.all.paginate(page: params[:page],per_page: 5)
  end

  def show
    @comment = current_user.comments.build
  end

  def new
    @picture = Picture.new
    @tags = Category.all
  end

  def edit
    @tags = Category.all
  end

  def create
    @picture = Picture.new(picture_params.except(:tags))
    picture_params[:tags].each do |tag,v|
      @picture.categories << Category.find_by_name(tag) unless v == "0"
    end
    respond_to do |format|
      if @picture.save
        format.html { redirect_to @picture, notice: 'Picture was successfully created.' }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @tags = Category.all
    @picture.categories = []
    picture_params[:tags].each do |tag,v|
      @picture.categories << Category.find_by_name(tag) unless v == "0"
    end
    respond_to do |format|
      if @picture.update(picture_params.except(:tags))
        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_picture
      @picture = Picture.find(params[:id])
    end

    def picture_params
      params.require(:picture).permit(:title, :description, :score,:picture, :tags => {})
    end
end
