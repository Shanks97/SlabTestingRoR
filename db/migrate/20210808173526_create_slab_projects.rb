class CreateSlabProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :slab_projects do |t|
      t.string :name
      t.string :description
      t.string :status
      t.date :start_at
      t.date :finish_at
      t.date :finished_at

      t.timestamps
    end
  end
end
