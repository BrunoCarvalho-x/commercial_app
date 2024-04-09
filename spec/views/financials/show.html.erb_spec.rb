require 'rails_helper'

RSpec.describe "financials/show", type: :view do
  before(:each) do
    assign(:financial, Financial.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
