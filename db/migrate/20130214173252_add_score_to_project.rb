class AddScoreToProject < ActiveRecord::Migration
  def change
    add_column :projects, :score, :integer

  end
end
