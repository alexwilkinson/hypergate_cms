class CreateEllerium < ActiveRecord::Migration
  def change
    create_table :ellerium do |t|

      t.timestamps null: false
    end
  end
end
