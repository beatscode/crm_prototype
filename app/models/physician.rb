class Physician < ActiveRecord::Base
  attr_accessible :id, :site_id, :prefix, :firstname, :initial, :lastname, :suffix, :title,:gender,:discipine
  set_table_name 'site_practice_physicians'
  self.primary_key = 'id'
end