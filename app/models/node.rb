class Node < ActiveRecord::Base
  self.table_name = "#{Settings.table_prefix}node"
  self.primary_key = 'nid'
  self.inheritance_column = "typpe"
  has_one :attached_images, foreign_key: "nid",  class_name: "ImageAttach"
  has_one :image_field, foreign_key: "nid", class_name: "ImageField"
  has_many :image, foreign_key: "nid", class_name: "Image"

  def self.instance_method_already_implemented?(method_name)
    return true if method_name == 'changed'
    return true if method_name == 'changed?'
    super
  end

end