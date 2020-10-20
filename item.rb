class Item
    attr_reader :title, :deadline, :description
    def valid_date?(date)
        input = date.split('-')
        year = input[0]
        month = input[1].to_i
        day = input[2].to_i

        return false if input.length > 3 || input.length < 3

        return false if (day > 31 || day < 0)

        return false if (month < 1 || month > 12)
    
        return false if year.length != 4 || year.to_i > 2020

        true
 
    end

    def initialize(title, deadline, description)
        @title = title
        raise "Deadline is not valid" if !valid_date?(deadline)
        @deadline = deadline
        @description = description
    end

    def deadline=(new_deadline)
        raise "Deadline is not valid" if !valid_date?(new_deadline)
        @deadline = new_deadline
    end

    def description=(new_description)
        raise "Description is not valid" if !(new_description.is_a? String)
        @description = new_description
    end

    def title=(new_title)
        raise "Title is not valid" if !(new_title.is_a? String)
        @title = new_title
    end

end # Item