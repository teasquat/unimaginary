class Point
  new:          (@position) =>
  set_position: (@position) =>

  ----------------------------------
  -- moves point by given deltas
  ----------------------------------
  translate: (delta) =>
    @position += delta

  ----------------------------------
  -- projecting point one dimension down
  ----------------------------------
  projection_n1: =>
    prime = {}

    for i, v in ipairs @pos.content
      l = a + @pos.content[#@pos.content]
      if i < #@pos.content
        prime[i] = a * v / l

    Vector prime

  ----------------------------------
  -- getting projection in given plane
  ----------------------------------
  get_n: (n, pos=@pos) =>
    if #pos.content <= n
      return pos
    else
      @get_n n, @projection_n1 pos
