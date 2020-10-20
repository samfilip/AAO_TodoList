require_relative 'item.rb'

class List

    LINE_WIDTH = 42
    INDEX_COL_WIDTH = 5
    ITEM_COL_WIDTH = 20
    DEAD_COL_WIDTH = 10

    def initialize(label)
        @label = label
        @items = []
    end

    attr_accessor :label

    def add_item(title, deadline, description="")
       
        item = Item.new(title, deadline, description)
        @items << item
        return true if @items.any?(item)
    end

    def size
        @items.length
    end

    def valid_index?(index)
        if index < 0 || index > @items.length - 1
            return false
        end
        true

    end

    def swap(index_1, index_2)
        return false if !valid_index?(index_1) || !valid_index?(index_2)
        copy_1 = @items[index_1]
        copy_2 = @items[index_2]
        @items[index_1] = copy_2
        @items[index_2] = copy_1
        return @items
    end

    def [](index)
        return nil if !valid_index?(index)
        @items[index]
    end

    def priority
        if self.size > 0
            return @items[0]
        end
        return "List is empty! Add a new list item."
    end

    def print
        puts "-" * LINE_WIDTH
        puts " " * 16 + self.label.upcase
        puts "-" * LINE_WIDTH
        puts "#{'Index'.ljust(INDEX_COL_WIDTH)} | #{'Item'.ljust(ITEM_COL_WIDTH)} | #{'Deadline'.ljust(DEAD_COL_WIDTH)}"
        @items.each_with_index do |item, idx|
            puts "#{idx.to_s.ljust(INDEX_COL_WIDTH)} | #{item.title.ljust(ITEM_COL_WIDTH)} | #{item.deadline.ljust(DEAD_COL_WIDTH)}"
        end
        puts "-" * LINE_WIDTH
    end
    
end