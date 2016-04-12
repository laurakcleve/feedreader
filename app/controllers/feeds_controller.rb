class FeedsController < ApplicationController

  def index
    @feeds = Feed.all
  end

  def new
    @feed = Feed.new
  end

  def create
    @feed = Feed.new(feed_params)

    respond_to do |format|
      if @feed.save
        format.html { redirect_to @feed, notice: 'Feed successfully added.' }
        format.json { render :show, status: :created, location: @feed }
      else
        format.html { render :new }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end


  private

  def feed_params
    params.require(:feed).permit(:name, :url, :description)
  end

end
