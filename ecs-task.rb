require 'json'
require 'date'

class PortMapping
  def initialize
    @portmap = {}
  end

  def containerPort(containerPort)
    @containerPort = containerPort.to_i
  end

  def hostPort(hostPort)
    @hostPort = hostPort.to_i
  end

  def protocol(protocol)
    @protocol = protocol
  end

  def show
     @portmap = {:containerPort => @containerPort, :hostPort => @hostPort, :protocol => @protocol}
  end

end

class EcsDef
  def initialize(title)
    @title = title
  end

  def name(name)
    @name = name
  end

  def image(image)
    @image = image 
  end

  def cpu(cpu)
    @cpu = cpu.to_i
  end

  def memory(memory)
    @memory = memory.to_i
  end

  def portmapping(&block)
    portmap = PortMapping.new
    portmap.instance_eval(&block)
    @portmaps = portmap.show
  end

  def show
     h = {:name => @name, :image => @image, :cpu => @cpu, :memory => @memory, :portMappings => @portmaps}
     puts h.to_json
  end
end

def ecs_task(title, &block)
  task = EcsDef.new(title)
  task.instance_eval(&block)
  task.show
end

load File.expand_path(ARGV[0])
