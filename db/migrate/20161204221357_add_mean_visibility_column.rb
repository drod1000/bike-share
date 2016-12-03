class AddMeanVisibilityColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :conditions, :mean_visibility_miles, :string
  end
end
