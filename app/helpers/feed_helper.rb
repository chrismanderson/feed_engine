module FeedHelper
  def previous_page?
    @page <= 1 ? false : true
  end

  def next_page?
    current_user.continue_stream?(@page * 12 + 1)
  end
end
