json.extract! score_log, :id, :name, :comment, :score, :published, :created_at, :updated_at
json.url score_log_url(score_log, format: :json)
