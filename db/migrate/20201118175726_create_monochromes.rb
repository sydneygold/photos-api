class CreateMonochromes < ActiveRecord::Migration[6.0]
  def change
    create_table :monochromes do |t|
      t.string :title
      t.string :caption
      t.string :image

      t.timestamps
    end
  end
end
