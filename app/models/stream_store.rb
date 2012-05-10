module StreamStore
  def update_stream
    REDIS.zadd "stream:user:#{self.user_id}", "#{self.created_at.to_i}", 
      "#{self.class.name}:#{self.id}"
  end

  def stream_items(index = 0, count = -1)
    # We can improve performance here by batching the queries
    REDIS.zrevrange("stream:user:#{self.id}", index, count).collect do |item|
      query = item.gsub(":", ".find ")
      eval query 
    end
  end
end
