class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.string :date
      t.string :home_team
      t.string :away_team
      t.integer :away_score
      t.integer :home_score
      t.string :home_logo
      t.string :away_logo
      t.string :uid
      t.timestamps
    end
  end
end
