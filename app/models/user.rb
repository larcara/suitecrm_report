class User < SuitecrmRecord
 self.table_name = "users"
 
 def full_name
  "#{first_name} #{last_name}"
 end
end
