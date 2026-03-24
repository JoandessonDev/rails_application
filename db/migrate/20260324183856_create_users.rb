class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :cpf
      t.string :email
      t.string :role
      t.decimal :salary

      t.timestamps
    end
  end
end
