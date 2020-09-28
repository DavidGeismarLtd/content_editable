FactoryBot.define do
  factory :page, class: Editables::Page  do
    name { Faker::Company.bs }
    description { Faker::Company.bs }
    kind { Faker::Company.bs }
  end
end
