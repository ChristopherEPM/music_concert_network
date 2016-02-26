class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.references :user, index: true
      t.references :concert, index: true

      t.timestamps null: false
    end
  end
end
