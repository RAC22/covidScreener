json.extract! guest, :id, :first_name, :last_name, :answered_yes, :user_id, :created_at, :updated_at
json.url guest_url(guest, format: :json)
