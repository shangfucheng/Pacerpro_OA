require 'rails_helper'

RSpec.describe Item, type: :model do
    describe "Soft Delete Functionality" do
      let!(:active_item) { create(:item) }
      let!(:deleted_item) { create(:item, deleted_at: Time.current) }
  
      describe "#soft_delete" do
        it "soft deletes an item by updating deleted_at" do
          active_item.soft_delete
          expect(active_item.deleted_at).to be_present
        end
      end
  
      describe "#restore" do
        it "restores a soft-deleted item by setting deleted_at to nil" do
          deleted_item.restore
          expect(deleted_item.deleted_at).to be_nil
        end
      end
  
      describe ".deleted" do
        it "excludes soft-deleted items from normal queries" do
          # Ensure the deleted_item is in the deleted scope
          expect(Item.deleted).to include(deleted_item)
  
          # Ensure the active_item is not in the deleted scope
          expect(Item.deleted).not_to include(active_item)
        end
      end
    end
  end