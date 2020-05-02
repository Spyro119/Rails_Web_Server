class AddAiIdToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :AiProfile, :string
  end
end
