class RemoveUserFromOrganization < ActiveRecord::Migration[5.2]
  def change
    remove_reference :organizations, :user
  end
end
