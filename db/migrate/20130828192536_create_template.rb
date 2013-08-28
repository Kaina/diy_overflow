class CreateTemplate < ActiveRecord::Migration
  def change
    create_table :template do |t|
      t.string     :title,   index: true
      t.text       :content, null: false
      t.belongs_to :author,  null: false, index: true
      t.belongs_to :parent
      t.timestamps
    end
  end
end
