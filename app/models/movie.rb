class Movie < ActiveRecord::Base
    def flop?
      total_gross < 50000000 || total_gross.blank?
    end

    def self.released
      Movie.where("released_on < ?", Time.now).order("released_on desc")
    end
end
