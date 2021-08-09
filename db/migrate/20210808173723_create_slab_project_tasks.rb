class CreateSlabProjectTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :slab_project_tasks do |t|
      t.string :name
      t.string :description
      t.string :status
      t.date :execution_at
      t.references :slab_project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
