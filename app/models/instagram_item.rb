class InstagramItem < ActiveRecord::Base
  include Streamable
  attr_accessible :image, :image_id

  belongs_to :user 

  has_many :stream_items, :as => :streamable

  serialize :image

  def image_url
    image["images"]["standard_resolution"]["url"]
  end

  def caption
    image["caption"]["text"]
  end

  def self.create_from_json(user_id, parsed_json)
    new(user_id: user_id,
        image_id: parsed_json["image"]["id"],
        image: parsed_json["image"])
  end
end