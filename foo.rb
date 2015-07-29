class DSL
  attr_reader :names

  def self.execute
    contents = File.open('DSLFile', 'rb'){ |f| f.read }
    dsl = new
    dsl.instance_eval(contents)

    p dsl.names
  end

  def initialize
    @names = []
  end

  def hello(name)
    @names << name
  end
end

DSL.execute
