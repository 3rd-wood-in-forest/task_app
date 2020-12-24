class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.date :start_date
      t.date :last_date
      t.string :all_day
      t.text :memo_contents

      t.timestamps
    end
  end
end
