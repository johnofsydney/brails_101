class CreatePinStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :pin_statuses do |t|
      t.boolean :on

      t.timestamps
    end
  end
end
