class User < SuitecrmRecord
 default_scope { where(deleted:0) }
 self.table_name = "users"
 
 def full_name
  "#{first_name} #{last_name}"
 end
end
