class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :messages, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.integer :views

      t.timestamps
    end
  end
end
