require 'rails_helper'

RSpec.describe Favorite, type: :model do
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:movie) }
end
