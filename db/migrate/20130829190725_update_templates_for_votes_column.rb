class UpdateTemplatesForVotesColumn < ActiveRecord::Migration
  def change
	 add_column :templates, :votes, :integer, default: 0
	end
end
