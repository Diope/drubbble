class AddImagesToPost < ActiveRecord::Migration
  def up
    add_attachment :posts, :userShot
  end

  def down
    remove_attachment :posts, :userShot
  end
end
