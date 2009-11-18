class User < ActiveRecord::Base
  validates_presence_of :email, :password
  validates_uniqueness_of :email

  before_create :set_last_save_type_on_create
  before_update :set_last_save_type_on_update

  protected

  def set_last_save_type_on_create
    self.last_save_type = 'create'
    true
  end

  def set_last_save_type_on_update
    self.last_save_type = 'update'
    true
  end
end
