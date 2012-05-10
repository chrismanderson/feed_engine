class FeedController < ApplicationController
  def show 
    if params[:page]
      @page = params[:page].to_i
      start = @page * 12
      @items = current_user.stream_items(start, start + 12)
    else
      @page = 1
      @items = current_user.stream_items(0, 12)
    end
  end
end
