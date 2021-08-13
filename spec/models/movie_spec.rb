require 'rails_helper'

RSpec.describe Movie, type: :model do
  it { should have_many(:favorites).dependent(:destroy) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:uid) }
  it { should validate_presence_of(:popularity) }
end
