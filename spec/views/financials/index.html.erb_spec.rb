require 'rails_helper'

RSpec.describe "financials/index", type: :view do
  before(:each) do
    assign(:financials, [
      Financial.create!(),
      Financial.create!()
    ])
  end

  it "renders a list of financials" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
