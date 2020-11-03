require 'pry'
class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def list_roles
    results = []
    self.characters.each_with_index do |character, index|
      results << "#{character.name} - #{self.characters[index].show.name}"
    end
    results
  end
end