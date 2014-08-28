class AddName < ActiveRecord::Migration
  def change
    remove_column :tasks, :tasks
    add_column :tasks, :name, :string
  end
end
