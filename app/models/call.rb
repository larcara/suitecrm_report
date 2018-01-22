class Call < SuitecrmRecord
    default_scope { where(deleted:0) }
    self.table_name = "calls"

end
