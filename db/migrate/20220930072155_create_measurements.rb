class CreateMeasurements < ActiveRecord::Migration[7.0]
  def change
    create_table :measurements do |t|
      t.float :temperature
      t.float :humidity

      t.timestamps
    end
  end
end
