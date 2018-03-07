class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments, id: :uuid do |t|
      t.references :commentable, polymorphic: true, type: :uuid
      t.string :subject
      t.text :body
      t.references :user, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
