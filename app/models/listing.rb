class Listing < ActiveRecord::Base
  belongs_to :subcategory
  belongs_to :user
  
  enum condition: [ :New, :Used ]
  enum delivery: { 'Meet Up' => 0, 'Mailing or Delivery'=> 1 }
end
