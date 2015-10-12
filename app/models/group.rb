class Group < ActiveRecord::Base

  has_many :members

  validates :name, presence: true
  validates :code, uniqueness: true

  before_create :generate_code

  private

    def generate_code
      while true
        code = rand(36**8).to_s(36)
        break unless Group.exists?(code: code)
      end
      self.code = code
    end
end
