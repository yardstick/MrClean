class Employee < ActiveRecord::Base
  validates_presence_of :first_name, :last_name

  belongs_to :office
  has_many :assignments

  def display_name
    if Employee.where(office: office, first_name: first_name).count > 1
      "#{first_name} #{last_name[0].upcase}."
    else
      first_name
    end
  end
end

