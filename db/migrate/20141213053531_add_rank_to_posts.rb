class AddRankToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :rank, :integer, index: true, null: false, default: 0
  end
end
