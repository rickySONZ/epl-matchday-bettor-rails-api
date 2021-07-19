class CreateScoreboards < ActiveRecord::Migration[6.1]
  def change
    create_table :scoreboards do |t|
      t.string :start_date
      t.string :end_date
      t.timestamps
    end
  end
end
