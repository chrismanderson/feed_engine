module ApplicationHelper
  def gravatar_url(user)
    Gravatar.new(user.email).image_url
  end

  def github?(user)
    service_connected(user, "github")
  end

  def twitter?(user)
    service_connected(user, "twitter")
  end

  def instagram?(user)
    service_connected(user, "instagram")
  end

  def service_connected(user, service)
    Authentication.where("user_id = ? and provider = ?", user.id, service).any?
  end

  def linked_services?(user)
    if user.nil?
      false
    else
      twitter?(user) || github?(user) || instagram?(user)
    end
  end
end
