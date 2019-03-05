class Character < ApplicationRecord
  belongs_to :house

  # ________________
  # getFamiliars
  # ________________
  # displays a list of familiar animals to use
  def getFamiliars
    familiarData = {}
    File.open("db/seedFiles/familiarData.rb") do |file|
      familiarData = eval(file.read)
    end
    familiarData[:Species]
  end


end