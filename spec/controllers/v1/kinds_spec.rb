require 'rails_helper'

describe V1::KindsController, type: :controller do
  it 'GET v1/contacts/:contact_id/kind authorized' do
    contact = Contact.first
    user = create(:user)

    sign_in user

    get :show, params: {contact_id: contact.id}
    expect(response).to have_http_status(:not_acceptable)
  end

  it 'GET v1/contacts/:contact_id/kind authorized' do
    contact = Contact.first
    user = create(:user)

    sign_in user
    request.headers['Accept'] = 'application/vnd.api+json'
    request.headers.merge!(user.create_new_auth_token)

    get :show, params: {contact_id: contact.id}
    expect(response).to have_http_status(:ok)
  end
end
