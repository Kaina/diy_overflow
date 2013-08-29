class Question < Template
  has_many :answers, foreign_key: :parent_id
end
