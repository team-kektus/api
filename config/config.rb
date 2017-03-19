module Config
  mattr_accessor :pepper
  @@pepper = '85ed2547d049ddb87d874019a30dda0d98a7d8af05706d573594c38a6351cc7eec3b7662ebfce2928364f136cfcdb49bcd67be794bf60aa84d9e1ede80bc7d9b'

  mattr_accessor :stretches
  @@stretches = 11
end
