class CreateProfileDescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_descriptions do |t|
      t.string :name
      t.text :body
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
