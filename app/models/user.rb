class User < ApplicationRecord
  validates :name, presence: true

  validates :email, presence: true

 validates :cpf,
  presence: true,
  uniqueness: { case_sensitive: false, message: "já está em uso" },
  length: { is: 11, message: "deve ter 11 dígitos" },
  numericality: { only_integer: true, message: "deve conter apenas números" }

  private 
  
  end
