class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @albums = Album.all.select {|album| album.user == current_user }
  end
 
  def show
  end

  def new
    @pictures = Picture.all
    @album = Album.new
  end

  def edit
    @pictures = Picture.all
  end

  
  def create
    @album = Album.new(album_params.except(:pictures))
    @pictures = Picture.all
    pic_names = album_params[:pictures]
    pic_names.each do |name,val|
      @album.pictures << Picture.find_by(title: name) unless val == 0
    end

    respond_to do |format|
      if @album.save
        format.html { redirect_to user_album_path(@album), notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @pictures = Picture.all
    pic_names = album_params[:pictures]
    @album.pictures = []
    pic_names.each do |name,val|
      @album.pictures << Picture.find_by(title: name) unless val == 0
    end
    respond_to do |format|
      if @album.update(album_params.except(:pictures))
        format.html { redirect_to user_album_path(@album), notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to user_albums_url, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_album
      @album = Album.find(params[:id])
    end

    def album_params
      params.require(:album).permit(:title,:pictures => {})
    end
  end
