class CreateActors < ActiveRecord::Migration[8.1]
  def change
    create_table :actors do |t|
      t.timestamps
      t.integer "agent_id"
      t.string "name"
    end
  end
end
