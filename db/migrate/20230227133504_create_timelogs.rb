class CreateTimelogs < ActiveRecord::Migration[6.1]
  def change
    create_table :timelogs do |t|

      t.integer :time, null: false
      t.string :action, null: false
      t.integer :effect, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
