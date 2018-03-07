class CreateSupportTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :support_tickets, id: :uuid do |t|
      t.string :subject, null: false
      t.text :body, null: false
      t.integer :urgency, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.references :user, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
