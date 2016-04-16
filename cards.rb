class Card
    attr_accessor :rank, :suit

    def initialize(rank, suit)
        self.rank = rank
        self.suit = suit
    end
    
    def output_card
        puts "#{self.rank} of #{self.suit}"
    end
    
    def self.random_card
        Card.new(rand(10), :spades)    
    end
end

class Deck
    # def initialize
    #     suits = [:clubs, :spades, :hearts, :diamonds]
    #     deck = []
    #     suits.each do |suit|
    #         (1..13).each {|rank| deck << [suit, rank]}
    #     end
        
    #     @all_cards = []
    #     deck.each do |card|
    #         @all_cards << Card.new(card[1], card[0])
    #     end
    # end
    

    # def initialize 
    #   suits = [:clubs, :spades, :hearts, :diamonds] 
    #   @all_cards = [] 
    #   ranks = ['Ace', *(2..10), 'Jack', 'Queen', 'King'] 
    #   ranks.each do |rank| 
    #     @all_cards << Card.new(rank, suit) 
    #   end 
    # end

    def initialize
        suits = [:clubs, :spades, :hearts, :diamonds]
        deck = []
        @all_cards = []
        ranks = ['Ace', *(2..10), 'Jack', 'Queen', 'King'] 
        suits.each do |suit|
            ranks.each {|rank| @all_cards << Card.new(rank, suit)}
        end
    end

    def shuffle
        @all_cards.shuffle!
    end
    
    def deal
        @all_cards.shuffle.shift
    end
end