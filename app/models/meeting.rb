class Meeting < SuitecrmRecord
    self.table_name = "meetings"
    self.inheritance_column = "not_sti"

end
