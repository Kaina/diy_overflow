class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string     :title,   index: true
      t.text       :content, null: false
      t.integer    :user_id,  null: false, index: true
      t.integer    :parent_id
      t.timestamps
    end
  end
end
