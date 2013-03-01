class CreateApprovals < ActiveRecord::Migration
  def change
    create_table :approvals do |t|
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
	add_index :approvals, :user_id
	add_index :approvals, :project_id
	add_index :approvals, [:user_id, :project_id], unique: true
  end
end
