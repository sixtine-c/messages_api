json.array! @messages do |message|
  json.extract! message, :id, :content, :user_id, :views
end
