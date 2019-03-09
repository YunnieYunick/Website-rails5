FactoryBot.define do
  factory :contact do
    name { "Ringo" }
    sequence(:email) {|n| "ringo#{n}@starr.com" }
    message { "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est officia enim voluptatum non. Debitis quaerat praesentium adipisci eum, iusto eligendi voluptatum ipsa. Sint, libero? Soluta consequatur delectus fugit a incidunt?" }
    
    factory :invalid_contact do
      name { nil }
    end
  end
end
