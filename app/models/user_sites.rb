class UserSites < ActiveRecord::Base
    attr_accessible :id,:user_id,:site_id
    self.table_name = "user_sites"
end