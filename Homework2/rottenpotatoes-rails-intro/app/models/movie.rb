# Code for this file based on this video: https://www.youtube.com/watch?v=OUCQ1VJ2Lzg
class Movie < ActiveRecord::Base
    def self.all_ratings
        a = Array.new
        self.select("rating").uniq.each {|x| a.push(x.rating)}
        a.sort.uniq
    end
end
