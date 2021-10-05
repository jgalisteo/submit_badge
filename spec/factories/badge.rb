FactoryBot.define do
  factory :badge do
    date { Time.zone.today }
    name { 'Name' }
  end
end
