class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :description
      t.string :time
      t.boolean :shouldRemind

      t.timestamps
    end
  end
end
