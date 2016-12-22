class CreateChildFatalities < ActiveRecord::Migration[5.0]
  def change
    create_table :child_fatalities do |t|
      t.date :dod
      t.string :gender
      t.integer :age
      t.string :county
      t.boolean :priorChild
      t.boolean :priorVerChild
      t.boolean :priorTwelve
      t.boolean :priorFive
      t.boolean :priorFiveServices
      t.string :causal
      t.text :narrative

      t.timestamps
    end
  end
end
