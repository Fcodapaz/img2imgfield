class ImageAttach < ActiveRecord::Base
  self.table_name = "#{Settings.table_prefix}image_attach"
  self.primary_key = "iid"
  belongs_to :image, foreign_key: "iid", class_name: "Image"
  belongs_to :node, foreign_key: "nid", class_name: "Node"
end