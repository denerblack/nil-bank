FactoryGirl.define do
  factory :balance do
    user
    amount 100.0
    last_operation Time.now
  end
end
