class CreateRadioShows < ActiveRecord::Migration
  def change
    create_table :radio_shows do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
