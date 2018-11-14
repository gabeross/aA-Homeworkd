# == Schema Information
#
# Table name: people
#
#  id        :integer          not null, primary key
#  name      :string           not null
#  house_key :integer          not null
#
validates :name, presence: true
class Person < ApplicationRecord
  belongs_to :house,
    primary_key: :id,
    foreign_key: :house_key,
    class_name: :House
end
