class CreateStudios < ActiveRecord::Migration[8.1]
  def change
    create_table :studios do |t|
      t.timestamps
      t.string "name"
    end
  end
end
