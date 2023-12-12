class AddUniquenessToMunicipes < ActiveRecord::Migration[6.0]
  def change
    add_index :municipes, :cpf, unique: true
    add_index :municipes, :cns, unique: true
    add_index :municipes, :email, unique: true
  end
end
