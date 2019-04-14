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

require 'rails_helper'

RSpec.describe Todo, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
