class AddReviewIdToUser < ActiveRecord::Migration
  def change
    add_reference :users, :review, index: true
    add_foreign_key :users, :reviews
  end
end
