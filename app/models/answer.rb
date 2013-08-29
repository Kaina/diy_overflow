class Answer < Template
  belongs_to :question, foreign_key: :parent_id
end
