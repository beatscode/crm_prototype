class UserSites < ActiveRecord::Base
    attr_accessible :id,:user_id,:site_id
    self.table_name = "user_sites"

    has_many :sites, :class_name => "Sites",
  	:foreign_key => "site_id"

  	has_many :users, :class_name => "Users",
  	:foreign_key => "user_id"

end