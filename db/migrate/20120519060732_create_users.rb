class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :github_uid
      t.string :name

      t.timestamps
    end
    add_index :users, :github_uid
  end
end
