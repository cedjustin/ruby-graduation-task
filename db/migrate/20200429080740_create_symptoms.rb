class CreateSymptoms < ActiveRecord::Migration[5.2]
  def change
    create_table :symptoms do |t|
      t.string :title
      t.string :content
      t.boolean :main, default: false

      t.timestamps
    end
  end
end
