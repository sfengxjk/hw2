class CreateAgents < ActiveRecord::Migration[8.1]
  def change
    create_table :agents do |t|
      t.timestamps
      t.string "name"
    end
  end
end
