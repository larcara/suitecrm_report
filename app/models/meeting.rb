class Meeting < SuitecrmRecord
    self.table_name = "meetings"
    self.inheritance_column = "not_sti"
    default_scope { where(deleted:0) }
end
