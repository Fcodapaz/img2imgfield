class LegacyFile < ActiveRecord::Base
  self.table_name = "#{Settings.table_prefix}files"
  self.primary_key = 'fid'
  has_many :images, foreign_key: "fid", class_name: "Image"
  has_many :images_fields, foreign_key: "field_image_fid", class_name: "ImageField"
end