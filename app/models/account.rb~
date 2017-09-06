class Account < SuitecrmRecord
    self.table_name = "accounts"
    has_many :account_contacts
    has_many :contacts, through: :account_contacts
    has_many :account_opportunities
    has_many :opportunities, through: :account_opportunities
    
    
    def calls
        Call.where(parent_id: self.id, parent_type:"Accounts")
    end
    def meetings
        Meeting.where(parent_id: self.id, parent_type:"Accounts")
    end
    def address
      [
      "#{self.billing_address_street}",
      "#{self.billing_address_postalcode} #{self.billing_address_city} (#{self.billing_address_state})"
      ]    
    end
    def assigned_to
      User.where(id: self.assigned_user_id).first
    end
end
