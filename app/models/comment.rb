class Comment < Template
	belongs_to :answer, foreign_key: :parent_id
	belongs_to :question, foreign_key: :parent_id
	after_save :set_type

	def set_type
    self.type = "comment"
  end
end