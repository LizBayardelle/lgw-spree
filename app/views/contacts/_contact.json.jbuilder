json.extract! contact, :id, :first_name, :last_name, :email, :phone, :preferred_contact, :subject, :message, :responded, :archived, :created_at, :updated_at
json.url contact_url(contact, format: :json)
