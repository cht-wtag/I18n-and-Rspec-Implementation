class AddBenutzerToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :benutzer, null: true, foreign_key: true
  end
end
