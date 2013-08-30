class Comment < Template
	belongs_to :answer, foreign_key: :parent_id
	belongs_to :question, foreign_key: :parent_id
end