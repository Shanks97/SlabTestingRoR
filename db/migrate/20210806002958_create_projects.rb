class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :code
      t.date :created_date
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
