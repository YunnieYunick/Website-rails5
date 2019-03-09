require 'rails_helper'

RSpec.describe ContactsController, type: :controller do

  it "GET #index" do
    get :index
    expect(response).to render_template :index
  end

  describe "POST #confirm" do
    context "with valid attributes" do
      it "renders the :confirm template" do
        post :confirm, params: { contact: attributes_for(:contact) }
        expect(response).to render_template :confirm
      end
    end

    context "with invalid attributes" do
      it "renders the :index template" do
        post :confirm, params: { contact: attributes_for(:invalid_contact) }
        expect(response).to render_template :index
      end
    end
  end

  describe "POST #create" do
    before do
      ActionMailer::Base.deliveries.clear
      @mail_array = ActionMailer::Base.deliveries
    end

    context "with params back" do
      it "renders the :index template" do
        post :create, params: { contact: attributes_for(:contact), back: '戻る' }
        expect(response).to render_template :index
      end
    end

    context "success deliver email" do
      before do
        @contact = build(:contact)
        UserMailer.contact_form(@contact).deliver
      end
      it "delivers email" do
        expect(@mail_array.count).to eq(1)
      end
      it "contain the user's message in the mail subject" do
        expect(@mail_array.first.subject).to match(/お問い合わせがありました/)
      end
      it "contain the user's message in the mail body name" do
        expect(@mail_array.first.body.raw_source).to match(/Ringo/)
      end
      it "contain the user's message in the mail body email" do
        expect(@mail_array.first.body.raw_source).to match(/starr.com/)
      end
      it "contain the user's message in the mail body message" do
        expect(@mail_array.first.body.raw_source).to match(/Lorem ipsum/)
      end
      it "renders :create template" do
        post :create, params: { contact: attributes_for(:contact)}
        expect(response).to render_template :create
      end
    end

    context "fail deliver email" do
      before do
        @contact = build(:contact)
      end
      pending "shows flash message" do
        expect(flash[:error]).not_to be_empty
      end
    end

    after{
      ActionMailer::Base.deliveries.clear
    }
  end

end
