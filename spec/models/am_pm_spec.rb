require 'rails_helper'

RSpec.describe AmPm, type: :model do
  it "Is a valid AM PM" do
  am = AmPm.new(name: "AM")
  expect(am.name).to eq("AM")
  end
end
