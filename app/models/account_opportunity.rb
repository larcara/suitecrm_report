class AccountOpportunity < SuitecrmRecord
    self.table_name = "accounts_opportunities"
    belongs_to :account
    belongs_to :opportunity
end
