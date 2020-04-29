class AddUserToSymptoms < ActiveRecord::Migration[5.2]
  def change
    add_reference :symptoms, :user, foreign_key: true
  end
end
