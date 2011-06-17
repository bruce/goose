module Goose

  class Address
    include Enumerable
    
    def initialize(head, *tail)
      if head.is_a?(Array)
        @head = head
      else
        @head_name = head
      end
      @tail = tail
    end

    def at?(head_name)
      if resolved?
        @head.first == head_name
      else
        @head_name == head_name
      end
    end

    def each(&block)
      list.each(&block)
    end

    def resolve(url)
      unless resolved?
        @head = [@head_name, url]
      end
    end

    private

    def list
      @list ||= [@head, *@tail].compact
    end

    def resolved?
      @head
    end
    
  end

end
