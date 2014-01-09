FactoryGirl.define do
  factory :ticket do
    title       "A ticket"
    description "A ticket, nothing else"
    user    { |u| u.assocation(:user)    }
    project { |p| p.assocation(:project) }
  end
end
