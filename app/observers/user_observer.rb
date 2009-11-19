class UserObserverCalledError < RuntimeError; end

class UserObserver < ActiveRecord::Observer
  def after_save(user)
    raise UserObserverCalledError unless user.email =~ /cucumber/i
  end
end