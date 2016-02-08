class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :userName
      t.string :hostName
      t.string :emailAddress
      t.string :timeServer
      t.string :password
      t.string :location
      t.integer :flashTime

      t.timestamps
    end
  end
end
