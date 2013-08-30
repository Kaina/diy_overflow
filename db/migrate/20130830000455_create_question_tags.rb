class CreateQuestionTags < ActiveRecord::Migration
  create_table :question_tags do |t|
  	t.integer  :question_id
  	t.integer  :tag_id
  end
end
