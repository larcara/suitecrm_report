class AccountOpportunity < SuitecrmRecord
    self.table_name = "accounts_opportunities"
#   default_scope { where(deleted:0) }
    belongs_to :account
    belongs_to :opportunity
end
