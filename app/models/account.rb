class Account < SuitecrmRecord
    self.table_name = "accounts"
    default_scope { where(deleted:0) }
    has_many :account_contacts
    has_many :contacts, through: :account_contacts
    has_many :account_opportunities
    has_many :opportunities, through: :account_opportunities
    has_one  :account_location, foreign_key: :id_c   

    def calls
        Call.where(["(parent_id=? and parent_type='Accounts') or (parent_id in (?) and parent_type='Contacts' ) or (parent_id in (?) and parent_type='Opportunities' )",self.id, contact_ids, opportunity_ids])
    end
    
    def meetings
        Meeting.where(["(parent_id=? and parent_type='Accounts') or (parent_id in (?) and parent_type='Contacts' ) or (parent_id in (?) and parent_type='Opportunities' )",self.id, contact_ids, opportunity_ids])
    end
    
    def address
      [
      "#{self.billing_address_street}",
      "#{self.billing_address_postalcode} #{self.billing_address_city} (#{self.billing_address_state})"
      ]    
    end

    
    def next
      Account.where(["name > ?", name]).order("name asc").first
    end
    def prev
      Account.where(["name > ?", name]).order("name asc").first
    end
#    def accounts_by_range(range)
#      account_location.accounts_by_range(range).map{|x| [x.account.name, x.account.id, x.jjwg_maps_lat_c, x.jjwg_maps_lng_c]}
#    end
end
