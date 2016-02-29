class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.float :usd
      t.float :eur
      t.datetime :date

      t.timestamps null: false
    end
  end
end
