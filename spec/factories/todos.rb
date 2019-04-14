# == Schema Information
#
# Table name: todos
#
#  id         :bigint(8)        not null, primary key
#  task       :string           not null
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :todo do
    task { "MyString" }
    user { nil }
  end
end
