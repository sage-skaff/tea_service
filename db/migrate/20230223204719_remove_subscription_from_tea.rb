class RemoveSubscriptionFromTea < ActiveRecord::Migration[6.1]
  def change
    remove_reference :teas, :subscription, null: false, foreign_key: true
  end
end
