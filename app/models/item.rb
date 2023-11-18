class Item < ApplicationRecord
  # Default scope to exclude "deleted" items from normal queries
  scope :active, -> { where(deleted_at: nil) }
  scope :deleted, -> { where.not(deleted_at: nil) }
  # Soft delete method
  def soft_delete
    update(deleted_at: Time.current)
  end

  # Restore method
  def restore
    update(deleted_at: nil)
  end
end
