class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string 'name', null: false
      t.integer 'house_key', null: false
      t.timestamp
    end
  end
end
