module Goose

  class Address
    include Enumerable
    
    def initialize(head_name, *tail)
      @head_name = head_name
      @tail = tail
    end

    def at?(head_name)
      @head_name == head_name
    end

    def each(&block)
      list.each(&block)
    end

    def resolve(url)
      @head_url = url
    end

    private

    def list
      [head, @tail]
    end

    def head
      if resolved_head?
        [@head_name, @head_url]
      else
        @head_name
      end
    end

    def resolved_head?
      @head_url
    end
    
  end

end
