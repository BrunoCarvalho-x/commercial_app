require 'rails_helper'

RSpec.describe "/orders", type: :request do
  describe "GET /index" do
    before { get orders_url }

    it "renders a successful response" do
      expect(response).to be_successful
    end
  end

  describe "GET /order/:id" do
    let(:order) { create(:order) }

    context "when the record exist" do
      before { get order_url(order.id) }

      it "renders a successful response" do
        expect(response).to be_successful
      end
    end

    context "when the record don't exist" do
      before { get order_url(9999) }

      it "renders a not found response" do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "GET /new" do
    before { get new_order_url }

    it "renders a successful response" do
      expect(response).to be_successful
    end
  end

  describe "GET /edit/order/:id" do
    let(:order) { create(:order) }

    context "when the record exist" do
      before { get edit_order_url(order.id) }

      it "renders a successful response" do
        expect(response).to be_successful
      end
    end

    context "when the record don't exist" do
      before { get edit_order_url(9999) }

      it "renders a not found response" do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      let(:valid_attributes) { attributes_for(:order) }

      it "creates a new Order" do
        expect { post(orders_url, params: { order: valid_attributes }) }
          .to change(Order, :count).by(1)
      end

      it "redirects to the created order" do
        expect(post(orders_url, params: { order: valid_attributes }))
          .to redirect_to(order_url(Order.last))
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { attributes_for(:order, client_name: nil) }

      it "does not create a new Order" do
        expect { post(orders_url, params: { order: invalid_attributes }) }
          .not_to change(Order, :count)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post(orders_url, params: { order: invalid_attributes })
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    let(:order) { create(:order) }

    context "with new valid parameters" do
      let(:new_valid_attributes) do
        {
          client_name: "Valid Name",
          description: "Valid Description",
          delivery_date: Time.zone.today + 1.day,
          delivery_hour: "8:30",
          value: 100.00
        }
      end

      before do
        patch order_url(order), params: { order: new_valid_attributes }
        order.reload
      end

      it "updates the requested order for: client_name" do
        expect(order.client_name).to eq("Valid Name")
      end

      it "updates the requested order for: description" do
        expect(order.description).to eq("Valid Description")
      end

      it "updates the requested order for: delivery_date" do
        expect(order.delivery_date).to eq(Time.zone.today + 1.day)
      end

      it "updates the requested order for: delivery_hour" do
        expect(order.delivery_hour).to eq("8:30")
      end

      it "updates the requested order for: value" do
        expect(order.value).to eq(100.00)
      end

      it "redirects to the order" do
        expect(response).to redirect_to(order_url(order))
      end
    end

    context "with invalid parameters" do
      before do
        patch order_url(order), params: { order: new_invalid_attributes }
      end

      context "when client_name invalid" do
        let(:new_invalid_attributes) { { client_name: nil } }

        it "renders a response with 422 status" do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context "when description invalid" do
        let(:new_invalid_attributes) { { description: nil } }

        it "renders a response with 422 status" do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context "when delivery_date invalid" do
        let(:new_invalid_attributes) { { delivery_date: nil } }

        it "renders a response with 422 status" do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context "when delivery_hour invalid" do
        let(:new_invalid_attributes) { { delivery_hour: nil } }

        it "renders a response with 422 status" do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context "when value invalid" do
        let(:new_invalid_attributes) { { value: nil } }

        it "renders a response with 422 status" do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:order) { create(:order) }

    it "destroys the requested order" do
      expect { delete order_url(order) }
        .to change(Order, :count).by(-1)
    end

    it "redirects to the orders list" do
      delete order_url(order)
      expect(response).to redirect_to(orders_url)
    end
  end
end
