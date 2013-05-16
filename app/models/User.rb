class User < ActiveRecord::Base
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