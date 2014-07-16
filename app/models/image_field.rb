class ImageField < ActiveRecord::Base
  self.table_name = "#{Settings.table_prefix}content_field_image"
  self.primary_key =  "vid"
  belongs_to :file, foreign_key: "field_image_fid", class_name: "LegacyFile"
  belongs_to :node, foreign_key: "nid", class_name: "Node"
end