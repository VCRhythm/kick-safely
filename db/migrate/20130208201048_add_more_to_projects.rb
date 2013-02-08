class AddMoreToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :thumbnail_url, :string

    add_column :projects, :pledge_percent, :integer

    add_column :projects, :description, :text

  end
end
