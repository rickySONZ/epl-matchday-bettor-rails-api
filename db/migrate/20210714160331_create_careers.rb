class CreateCareers < ActiveRecord::Migration[6.1]
  def change
    create_table :careers do |t|

      t.timestamps
    end
  end
end
