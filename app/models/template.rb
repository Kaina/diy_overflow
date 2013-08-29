class Template < ActiveRecord::Base
  belongs_to :parent,   class_name: "Template"
  has_many   :children, class_name: "Template", foreign_key: :parent_id

  validates_presence_of :content

  attr_accessible :title, :content, :parent_id, :votes
end
