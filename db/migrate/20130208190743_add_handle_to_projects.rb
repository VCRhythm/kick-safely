class AddHandleToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :handle, :string

  end
end
