require "rails_helper"

describe FactoryBot do
  it "has all valid factories" do
    described_class.lint
  end
end
