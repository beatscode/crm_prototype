class Staff < ActiveRecord::Base
  attr_accessible :id, :site_id, :prefix, :firstname, :initial, :lastname, :suffix, :position,:experience,:gender,:photo,:biography,:title,:created_at,:udpated_at, :photo_media_id, :cv_media_id
  self.table_name = 'site_staff'
  self.primary_key = 'id'
end