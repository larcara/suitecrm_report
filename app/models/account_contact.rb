class AccountContact < SuitecrmRecord
    self.table_name = "accounts_contacts"
    belongs_to :account
    belongs_to :contact
end
