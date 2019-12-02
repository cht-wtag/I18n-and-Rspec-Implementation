class CreateUsers < ActiveRecord::Migration[6.0]
def up
  def change
    create_table :users do |t|
      t.text :name
      t.integer :age
      t.integer :mobile
      t.references :benutzer, null: false, forign_key: true
    end
  end
  end

def down
drop_table :users
end

end