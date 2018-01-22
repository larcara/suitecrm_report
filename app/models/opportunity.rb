class Opportunity < SuitecrmRecord
    self.table_name = "opportunities"
    default_scope { where(deleted:0) }
    has_many :account_opportunities
end
