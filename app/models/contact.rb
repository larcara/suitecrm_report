class Contact < SuitecrmRecord
  self.table_name = "contacts"
  has_many :account_contacts
  has_many :accounts, through: :account_contacts
  default_scope { where(deleted:0) }
  def full_name
   "#{first_name} #{last_name}"
  end
end
