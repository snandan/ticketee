FactoryGirl.define do
  factory :comment do
    text "A plain old comment"
    ticket { |t| t.association(:ticket) }
    user   { |u| u.association(:user) }
  end
end
