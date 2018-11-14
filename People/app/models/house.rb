# == Schema Information
#
# Table name: houses
#
#  id      :integer          not null, primary key
#  address :string           not null
#
validates :address, presence: true, uniqueness: true
class House < ApplicationRecord
  has_many :people,
    primary_key: :id,
    foreign_key: :house_key,
    class_name: :Person
end
