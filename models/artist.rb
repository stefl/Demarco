class Artist
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  field :name
  field :description
  has_and_belongs_to_many :image

  private
  def generate_slug
    name.parameterize
  end
end
