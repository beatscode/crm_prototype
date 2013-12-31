class User < ActiveRecord::Base
  
    attr_accessible :reseller_id, :role_id, :login, :password, :cookie_hash, :purchased, :confirmed, :confirmation_code, :primary
    belongs_to :reseller
    belongs_to :company
    has_and_belongs_to_many :sites, :join_table => 'user_sites'

    ###
    # Get the role of a specific user
    def get_role
        return case self.role_id
            when 2
                "User"
        else
            "N/A"
        end
    end
end