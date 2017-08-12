class RenameWorksToProjects < ActiveRecord::Migration[5.1]
  def change
    rename_table :works, :projects 
  end
end
