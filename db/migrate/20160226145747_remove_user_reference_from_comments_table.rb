class RemoveUserReferenceFromCommentsTable < ActiveRecord::Migration
  def change
    remove_reference :comments, :user, index: true
  end
end
