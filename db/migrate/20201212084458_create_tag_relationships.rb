class CreateTagRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_relationships do |t|
      t.references :food, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
