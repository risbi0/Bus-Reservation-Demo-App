class CreateSeatings < ActiveRecord::Migration[6.1]
  def change
    create_table :seatings do |t|
      47.times { |i| t.boolean (i + 1).humanize.tr('-', '_').to_sym, default: true }
      t.references :schedule, index: true, foreign_key: true

      t.timestamps
    end
  end
end
