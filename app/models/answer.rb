class Answer < Template
  belongs_to :question, foreign_key: :parent_id
  after_save :set_type

  def set_type
    self.type = "answer"
  end
end
