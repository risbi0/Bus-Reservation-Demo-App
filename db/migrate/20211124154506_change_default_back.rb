class ChangeDefaultBack < ActiveRecord::Migration[6.1]
  def change
    47.times { |i| change_column :seatings, (i + 1).humanize.tr('-', '_').to_sym, :boolean, default: true }
  end
end
