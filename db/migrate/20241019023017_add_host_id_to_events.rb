class AddHostIdToEvents < ActiveRecord::Migration[7.2]
  def change
    add_reference :events, :host, null: false, foreign_key: { to_table: :users }
  end
end
