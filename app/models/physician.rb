class Physician < ActiveRecord::Base
  attr_accessible :id, :site_id, :prefix, :firstname, :initial, :lastname, :suffix, :title,:gender,:discipine
  self.table_name ='site_practice_physicians'
  self.primary_key = 'id'
end