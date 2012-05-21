class TextItemsController < ApplicationController

  def new
    @text_item = TextItem.new
  end

  def create
    @text_item = current_user.text_items.new(params[:text_item])
    if @text_item.save
      respond_to do |format|
        format.js
        format.html do
          redirect_to dashboard_path, notice: 'Text Post was successfully created.'
        end
      end
    else
      @link_item = LinkItem.new
      @image_item = ImageItem.new
      render :template => "dashboard/show"
    end
  end

  def show
  end
end
