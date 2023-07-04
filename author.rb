class Author
  attr_reader :id, :first_name, :last_name, :items

  def initialize(first_name, last_name)
    @id = Random.rand(1...1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    if item.is_a?(Item)
      @items << item
      item.author = self
    else
      raise TypeError, 'Invalid type, must be an Item instance'
    end
  end
end
