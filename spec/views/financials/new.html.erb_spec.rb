require 'rails_helper'

RSpec.describe "financials/new", type: :view do
  before(:each) do
    assign(:financial, Financial.new())
  end

  it "renders new financial form" do
    render

    assert_select "form[action=?][method=?]", financials_path, "post" do
    end
  end
end
