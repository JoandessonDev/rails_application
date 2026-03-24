class FixCpfType < ActiveRecord::Migration[8.1]
def change
  remove_column :users, :cpf
  add_column :users, :cpf, :string
end
end
