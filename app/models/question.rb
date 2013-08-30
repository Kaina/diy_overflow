class Question < Template
  has_many :answers, foreign_key: :parent_id
  has_many :question_tags
  has_many :tags, through: :question_tags

  attr_writer :tag_names
  attr_accessible :tag_names
  
  after_save :set_tags

  def tag_names
  	@tag_names || tags.map(&:name).join(' ')
  end

  private

  def set_tags
  	if @tag_names
  	  self.tags = @tag_names.split(' ').map do |name|
  	  	Tag.find_or_create_by_name(name: name.strip)
  	  end
  	end
  end
end
