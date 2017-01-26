FactoryGirl.define do
  factory :listing do
    user
    subcategory
    name "PS4 Pro"
    price 314
    currency "MYR"
    condition "New"
    delivery  0

  end
end
