require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ("A".."Z").to_a.sample(10)
  end

  def score
    @proposal = params[:proposal]
    @letters = params[:letters]
    @sentence = conditions(@letters, @proposal)
  end

  def conditions(letters, proposal)
    @result = ""
    #is the world english ?
    if in_the_grid?(letters, proposal.upcase) && english?(proposal.upcase)
      @result = "Congragulations! #{proposal.upcase} is a valid english word"
    elsif english?(proposal.upcase) == false
      @result = "Sorry but #{proposal.upcase} doesn't seem a valid english word"
      #view not english
    else
      @result = "Sorry but #{proposal.upcase} can't be built of #{letters.split(",").join}"
      #view not valid
    end
    return @result
  end


  def english?(proposal)
    url = "https://wagon-dictionary.herokuapp.com/#{proposal}"
    word_serialized = open(url).read
    word = JSON.parse(word_serialized)
    word["found"]
  end

  def in_the_grid?(grid, attempt)
    attempt.chars.all? { |letter| attempt.count(letter) <= grid.count(letter) }
  end
end
