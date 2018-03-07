class AddTicketNumberToSupportTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :support_tickets, :ticket_number, :string, null: false
    add_index :support_tickets, :ticket_number, unique: true
  end
end
