require 'rails_helper'

describe V2::PhonesController, type: :controller do
  it 'GET v2/contacts/:contact_id/phones not acceptable' do
    contact = Contact.first

    get :show, params: {contact_id: contact.id}
    expect(response).to have_http_status(:not_acceptable)
  end

  it 'GET v2/contacts/:contact_id/phones authorized' do
    contact = Contact.first

    request.headers['Accept'] = 'application/vnd.api+json'

    get :show, params: {contact_id: contact.id}
    expect(response).to have_http_status(:ok)
  end
end
