class Channel < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  before_validation :generate_uuid

  private

  def generate_uuid
    self.uuid = UUID.generate
  end
end
