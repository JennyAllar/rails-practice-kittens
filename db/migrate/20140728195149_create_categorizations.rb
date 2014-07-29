class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.belongs_to :kitten
      t.belongs_to :category
    end
  end
end
