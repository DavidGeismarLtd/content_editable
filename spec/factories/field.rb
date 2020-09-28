FactoryBot.define do
  factory :field, class: Editables::Field do
    association :page, factory: :page
    label { Faker::Company.bs }
    kind { ['image', 'text'].sample }
    value { Faker::Company.bs }


    trait :with_image do
      kind { 'image' }
    end

    trait :with_text do
      kind { 'text' }
    end
  end
end
