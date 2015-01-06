class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :nickname
      t.text :content
      t.boolean :is_admin, null: false, default: false

      t.timestamps
    end
  end
end
