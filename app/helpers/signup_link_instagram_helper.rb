module SignupLinkInstagramHelper
  SEARCH_STRING = "user_id = ? and provider = ?"
  def instagram_connected?(user)
    Authentication.where(SEARCH_STRING, user.id, "instagram").any?
  end
end
