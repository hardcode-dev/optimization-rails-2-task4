class AddColorsToOrgs < ActiveRecord::Migration[5.1]
  def change
    add_column :organizations, :bg_color_hex, :string
    add_column :organizations, :text_color_hex, :string

  end
end
