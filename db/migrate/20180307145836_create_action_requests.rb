class CreateActionRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :action_requests, id: :uuid do |t|
      t.string :type, null: false
      t.text :body, null: false
      t.references :user, foreign_key: true, type: :uuid
      t.boolean :completed, null: false, default: false

      t.timestamps
    end
  end
end
