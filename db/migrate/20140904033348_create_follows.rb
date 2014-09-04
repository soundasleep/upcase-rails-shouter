class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.belongs_to :source, index: true
      t.belongs_to :target, index: true

      t.timestamps
    end
  end
end
