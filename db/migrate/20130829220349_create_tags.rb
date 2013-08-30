class CreateTags < ActiveRecord::Migration
  def change
  	create_table :tags do |t|
  	  t.string   :name, index: true, null: false
  	  t.integer  :question_id
  	  t.integer  :user_id
  	  t.timestamps
  	end
  end
end
