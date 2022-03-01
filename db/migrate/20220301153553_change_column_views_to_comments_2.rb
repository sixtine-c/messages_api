class ChangeColumnViewsToComments2 < ActiveRecord::Migration[6.0]
  def change
     change_column :messages, :views, :integer, default: "0"
  end
end
