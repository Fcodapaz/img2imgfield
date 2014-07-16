class Image < ActiveRecord::Base
  self.table_name = "#{Settings.table_prefix}image"
  self.primary_key = 'nid'
  belongs_to :file, foreign_key: "fid", class_name: "LegacyFile"
  belongs_to :node, foreign_key: "nid", class_name: "Node"
  has_many :images_attacheds, foreign_key: "iid"

  default_scope { where(image_size: "_original") }
end