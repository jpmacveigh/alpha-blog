class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :articles , :descrition, :description
  end
end
