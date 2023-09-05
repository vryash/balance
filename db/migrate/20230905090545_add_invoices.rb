class AddInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.integer :amount
      t.string :operator

      t.timestamps
    end

    add_reference :invoices, :user, foreign_key: true
  end
end
