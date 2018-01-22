class SuitecrmRecord < ApplicationRecord
    ActiveRecord::Base.establish_connection(
  :adapter  => "mysql2",
  :host     => "localhost",
  :username => "suitecrm",
  :password => "suitecrm",
  :database => "suitecrm"
)
#  default_scope { where(deleted:0) }
    def assigned_to
      User.where(id: self.assigned_user_id).first
    end
end
