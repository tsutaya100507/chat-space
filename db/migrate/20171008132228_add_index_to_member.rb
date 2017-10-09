class AddIndexToMember < ActiveRecord::Migration[5.0]
  def change
    change_column_null :members, :user_id, true
    change_column_null :members, :group_id, true
  end
end
