class SubscriptionJob
  @queue = :subscription

  def self.perform
    Authentication.all.each do |auth|
      Resque.enqueue(upper_case(auth).constantize, auth.user, auth)
    end
    Subscription.all.each do |sub|
      Resque.enqueue(RefeedJob, sub.follower, sub)
    end
  end

  def self.upper_case(auth)
    "#{auth.provider.capitalize}Job"
  end
end

