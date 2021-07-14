class CreateApis < ActiveRecord::Migration[6.1]
  def change
    create_table :apis do |t|
      t.string :name
      t.string :logo
      
      t.timestamps
    end
  end
end
