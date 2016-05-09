class AddQuestionsTable < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question, limit: 200, null: :false
      t.string :answer,   limit: 60,  null: :false
      t.integer :level,               null: :false

      t.timestamps
    end
  end
end
