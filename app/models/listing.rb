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

  # Scopes -------------------------------------------------------
  scope :search_query, lambda { |query|
    terms = query.downcase.split(/\s+/)

    # replace the '*' char and replace it with '%', add '%', then replace with one '%' char if there is more '%' chars
    terms = terms.map { |e| ('%' + e.gsub('*', '%') + '%').gsub(/%+/, '%') }

    num_or_conds = 2

    where(
      terms.map { |term| "(LOWER(listings.name) LIKE ? OR LOWER(listings.description) LIKE ?)" }.join(' AND '),
      *terms.map { |e| [e] * num_or_conds }.flatten
    )

  }


end
