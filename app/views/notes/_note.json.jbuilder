json.extract! note, :id, :track_id, :user_id, :content, :created_at, :updated_at
json.url note_url(note, format: :json)
