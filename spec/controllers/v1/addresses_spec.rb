require 'rails_helper'

describe V1::AddressesController, type: :controller do
  it 'GET v1/contacts/:contact_id/address authorized' do
    contact = Contact.first

    get :show, params: {contact_id: contact.id}
    expect(response).to have_http_status(:not_acceptable)
  end

  it 'GET v1/contacts/:contact_id/address authorized' do
    contact = Contact.first

    request.headers['Accept'] = 'application/vnd.api+json'

    get :show, params: {contact_id: contact.id}
    expect(response).to have_http_status(:ok)
  end
end