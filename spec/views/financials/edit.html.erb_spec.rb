require 'rails_helper'

RSpec.describe "financials/edit", type: :view do
  let(:financial) {
    Financial.create!()
  }

  before(:each) do
    assign(:financial, financial)
  end

  it "renders the edit financial form" do
    render

    assert_select "form[action=?][method=?]", financial_path(financial), "post" do
    end
  end
end
