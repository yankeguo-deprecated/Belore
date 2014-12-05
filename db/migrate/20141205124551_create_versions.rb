class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :title, null: false
      t.string :lang,  null: false, index: true
      t.text :content, null: false
      t.text :content_plain
      t.text :content_rich
      t.belongs_to :post, index: true, null: false

      t.timestamps
    end
  end
end
