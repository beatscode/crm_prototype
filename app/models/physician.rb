class Physician < ActiveRecord::Base
  attr_accessible :id, :site_id, :prefix, :firstname, :initial, :lastname, :suffix, :title,:gender,:discipine, :specialty_id, :sub_specialty_id, :cv_media_id, :photo_media_id, :discipline, :photo, :medschool, :board_certificates, :undergrad, :membership, :organizations, :achievements, :residency, :biography, :cv, :languages, :photo_media_id, :cv_media_id
  self.table_name ='site_practice_physicians'
  self.primary_key = 'id'
end