class RenameColumnLocalesToLocaleTableTranslates < ActiveRecord::Migration[5.2]
  def change
    rename_column :translates, :locales, :locale
  end
end
