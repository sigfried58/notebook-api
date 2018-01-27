require 'rails_helper'

RSpec.describe "Contacts", type: :request do
  describe "GET /contacts" do
    it "works! 200 OK" do
      get v1_contacts_path, params: {}, headers: { 'HTTP_ACCEPT' => "application/vnd.api+json" }
      expect(response).to have_http_status(200)
    end

    it "index - JSON" do
      get v1_contacts_path, params: {}, headers: { 'HTTP_ACCEPT' => "application/vnd.api+json" }
      expect(response.body).to include_json(
        data: [
          {
            id: /\d/,
            type: "contacts",
            attributes: {
              name: (be_kind_of String),
              email: (be_kind_of String),
              birthdate: (be_kind_of String)
            }
          }
        ]
      )
    end

    it "show - JSON" do
      get '/v1/contacts/1.json', params: {}, headers: { 'HTTP_ACCEPT' => "application/vnd.api+json" }
      expect(response.body).to include_json(
        data: {
          id: /\d/,
          type: "contacts",
          attributes: {
            name: (be_kind_of String),
            email: (be_kind_of String),
            birthdate: (be_kind_of String)
          }
        }
      )
    end

    it "JSON Schema" do
      get '/v1/contacts/1.json', params: {}, headers: { 'HTTP_ACCEPT' => "application/vnd.api+json" }
      expect(response).to match_response_schema("contact")
    end

    it "create - JSON" do
      user = create(:user)

      login_as(user, scope: :user)
      headers = { "Accept" => "application/vnd.api+json", "Content-Type" => "application/vnd.api+json"}
      contact_params = attributes_for(:contact)
      contacts_params = '{
        "data": {
            "type": "contacts",
            "attributes": {
                "name": "Jimmy Ibanez",
                "email": "jimmy@damore.name",
                "birthdate": "12/2/1990"
            },
            "relationships": {
                "kind": {
                    "data": {
                        "id": "1",
                        "type": "kinds"
                    }
                }
            }
        }
      }'
      post v1_contacts_path, params: contacts_params, headers: headers

      expect(response.body).to include_json(
        data: {
          id: /\d/,
          type: "contacts",
          attributes: {
            name: (be_kind_of String),
            email: (be_kind_of String),
            birthdate: (be_kind_of String)
          }
        }
      )
    end

    # it "update - JSON" do
    #   user = create(:user)
    #   contact = Contact.last
    #   # contact.name += "-Actualizado"
    #   p contact
    #   login_as(user, scope: :user)
    #   headers = { "Accept" => "application/vnd.api+json", "Content-Type" => "application/vnd.api+json"}
    #   contact_params = attributes_for(:contact)
    #   contacts_params = '{
    #     "data": {
    #         "id": "100",
    #         "type": "contacts",
    #         "attributes": {
    #             "name": "Actualizado",
    #             "email": "jimmy@damore.name",
    #             "birthdate": "12/2/1990"
    #         },
    #         "relationships": {
    #             "kind": {
    #                 "data": {
    #                     "id": "1",
    #                     "type": "kinds"
    #                 }
    #             }
    #         }
    #     }
    #   }'

    #   patch "/v1/contacts/100.json", params: contacts_params, headers: headers
    #   p response.body
    #   expect(response.body).to include_json(
    #     data: {
    #       id: /\d/,
    #       type: "contacts",
    #       attributes: {
    #         name: 'Actualizado'
    #       }
    #     }
    #   )
    # end

    # First delete phones and address, later delete contact
    # it "destroy - JSON" do
    #   user = create(:user)
    #   contact = Contact.first

    #   login_as(user, scope: :user)
    #   headers = { "Accept" => "application/vnd.api+json", "Content-Type" => "application/vnd.api+json"}
  
    #   expect{ delete "/v1/contacts/#{contact.id}.json", params: {}, headers: headers }.to change(Contact, :count).by(-1)
    # end
  end
end
