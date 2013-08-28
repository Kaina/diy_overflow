class Template < ActiveRecord::Base
  belongs_to :parent,   class_name: "Template", foreign_key: :parent_id
  belongs_to :author,   foreign_key: :user_id
  has_many   :children, class_name: "Template", foreign_key: :parent_id

  validates_presence_of :content, :author
end
