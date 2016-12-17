class Vector
  new: (@content = {}) =>
    @type    = "vector"

  __add: (other) =>
    switch other.type
      when "vector"
        assert #@content == #other.content, "Can't operate vectors of different dimensions!"
        Vector [@content[i] + o for i, o in ipairs other.content]
      when "matrix"
        pass = {}

        for i = 1, #other.content / other.cols
          p = 0
          for n = 0, other.cols
            p += other.content[(i * other.cols) + n] + @content[n]

          pass[#pass + 1] = p

        Vector pass

  __sub: (other) =>
    switch other.type
      when "vector"
        assert #@content == #other.content, "Can't operate vectors of different dimensions!"
        Vector [@content[i] - o for i, o in ipairs other.content]
      when "matrix"
        pass = {}

        for i = 1, #other.content / other.cols
          p = 0
          for n = 0, other.cols
            p += other.content[(i * other.cols) + n] + @content[n]

          pass[#pass + 1] = p

        Vector pass

  __mul: (other) =>
    switch other.type
      when "vector"
        assert #@content == #other.content, "Can't operate vectors of different dimensions!"
        Vector [@content[i] * o for i, o in ipairs other.content]
      when "matrix"
        pass = {}

        for i = 1, #other.content / other.cols
          p = 0
          for n = 0, other.cols
            p += other.content[(i * other.cols) + n] + @content[n]

          pass[#pass + 1] = p

        Vector pass

  __div: (other) =>
    switch other.type
      when "vector"
        assert #@content == #other.content, "Can't operate vectors of different dimensions!"
        Vector [@content[i] / o for i, o in ipairs other.content]

      when "matrix"
        pass = {}

        for i = 1, #other.content / other.cols
          p = 0
          for n = 0, other.cols
            p += other.content[(i * other.cols) + n] + @content[n]

          pass[#pass + 1] = p

        Vector pass

  __neg: =>
    Vector [-o for i, o in ipairs @content]
