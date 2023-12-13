class CreateMunicipes < ActiveRecord::Migration[7.0]
  def change
    create_table :municipes do |t|
      t.string :full_name
      t.string :cpf
      t.string :cns
      t.string :email
      t.date :birth_date
      t.string :phone
      t.string :photo
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
