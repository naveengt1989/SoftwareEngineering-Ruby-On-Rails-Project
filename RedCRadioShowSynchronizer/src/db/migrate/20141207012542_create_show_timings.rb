class CreateShowTimings < ActiveRecord::Migration
  def change
    create_table :show_timings do |t|
      t.belongs_to :radio_show, index: true
      t.string :segment_name, index: true
      t.string :day
      t.time :startTime
      t.time :endTime

      t.timestamps
    end
  end
end
