class UserAudit < ActiveRecord::Base
    attr_accessible :id,:user_id,:server_info,:user_data,:location,:ip_address,:created_at
    self.table_name = "user_audit"
end