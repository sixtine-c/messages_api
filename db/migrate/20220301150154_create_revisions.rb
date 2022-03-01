class CreateRevisions < ActiveRecord::Migration[6.0]
  def change
    create_table :revisions do |t|
      t.uuid :identifier
    end
  end
end
