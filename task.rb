ecs_task "foo" do
  name "foo"
  image "foo"
  portmapping do
    containerPort 4567
    hostPort 0
  end
  portmapping do
    containerPort 4568
    hostPort 0
  end
end
