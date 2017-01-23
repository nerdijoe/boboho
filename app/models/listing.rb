class Listing < ActiveRecord::Base
  belongs_to :subcategory
  belongs_to :user

  enum condition: [ :New, :Used ]
  enum delivery: { 'Meet Up' => 0, 'Mailing or Delivery'=> 1 }

  mount_uploaders :photos, ImageUploader

  validates :name, presence: true
  validates :price, presence: true
  validates :currency, presence: true
  validates :condition, presence: true
  validates :delivery, presence: true
  validates :subcategory_id, presence: true


end
