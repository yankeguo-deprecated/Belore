class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.boolean :is_published, null: false, default: false, index: true

      t.timestamps
    end
  end
end
