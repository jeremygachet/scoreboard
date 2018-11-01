class TeamSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :company, :total_score, :updated_at, :logo
  # cache expires_in: 30.minutes, skip_digest: true

  def logo 
    unless object.logo.attachment.nil?
      variant = object.logo.variant(resize: "400x400>").processed 
      return rails_representation_url(variant, only_path: true) 
    end  
  end
end
