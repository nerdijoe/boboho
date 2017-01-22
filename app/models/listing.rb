class Listing < ActiveRecord::Base
  belongs_to :subcategory

  enum condition: [ :New, :Used ]
  enum delivery: { 'Meet Up' => 0, 'Mailing or Delivery'=> 1 }
end
