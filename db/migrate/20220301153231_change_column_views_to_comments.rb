class ChangeColumnViewsToComments < ActiveRecord::Migration[6.0]
  def change
    change_column :messages, :views, :integer, deafult: "0"
  end
end
