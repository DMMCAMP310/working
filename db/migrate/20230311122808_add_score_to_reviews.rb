class AddScoreToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :score, :integer, :unsigned => true, :default => 0
  end
end
