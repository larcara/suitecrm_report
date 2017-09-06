class SuitecrmRecord < ApplicationRecord
    ActiveRecord::Base.establish_connection(
  :adapter  => "mysql2",
  :host     => "localhost",
  :username => "suitecrm",
  :password => "suitecrm",
  :database => "suitecrm"
)
 
end
