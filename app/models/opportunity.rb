class Opportunity < SuitecrmRecord
    self.table_name = "opportunities"
    has_many :account_opportunities
end
