class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :content
      t.integer :target_id
      t.integer :des_id
      t.string :des_type
      t.integer :url
      t.datetime :opened_at

      t.timestamps
    end
  end
end
