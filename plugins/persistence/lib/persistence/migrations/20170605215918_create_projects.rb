class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects, id: 'string' do |t|
      t.string :name
      t.text :summary
      t.string :next_milestone
      t.timestamps
    end
  end
end
