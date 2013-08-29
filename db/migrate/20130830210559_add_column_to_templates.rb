class AddColumnToTemplates < ActiveRecord::Migration
  def change
   add_column :templates, :type, :string
  end
end
