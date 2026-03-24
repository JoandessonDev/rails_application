class ChangeUserCpfToString < ActiveRecord::Migration[8.1]
  def change
    change_column :users, :cpf, :string
  end
end
