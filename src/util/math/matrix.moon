class Matrix
  new: (@rows, @cols, d) =>

    @content = Vector content or [d for i = 1, @rows * @cols]
    @type    = "matrix"

  __add: (other) =>
    switch other.type
      when "vector"
        pass = {}

        for i = 1, #@content / @cols
          p = 0
          for n = 0, @cols
            p += @content[(i * @cols) + n] + other.content[n]

          pass[#pass + 1] = p

        Vector pass

      when "matrix"
        assert other.cols == @cols and other.rows == @rows, "Can't operate matrices of different dimensions!"
        Matrix\from @rows, @cols, @content + other.content

  __sub: (other) =>
    switch other.type
      when "vector"
        pass = {}

        for i = 1, #@content / @cols
          p = 0
          for n = 0, @cols
            p -= @content[(i * @cols) + n] + other.content[n]

          pass[#pass + 1] = p

        Vector pass

      when "matrix"
        assert other.cols == @cols and other.rows == @rows, "Can't operate matrices of different dimensions!"
        Matrix\from @rows, @cols, @content - other.content

  __mul: (other) =>
    switch other.type
      when "vector"
        pass = {}

        for i = 1, #@content / @cols
          p = 0
          for n = 0, @cols
            p *= @content[(i * @cols) + n] + other.content[n]

          pass[#pass + 1] = p

        Vector pass

      when "matrix"
        assert other.cols == @cols and other.rows == @rows, "Can't operate matrices of different dimensions!"
        Matrix\from @rows, @cols, @content * other.content

  __div: (other) =>
    switch other.type
      when "vector"
        pass = {}

        for i = 1, #@content / @cols
          p = 0
          for n = 0, @cols
            p /= @content[(i * @cols) + n] + other.content[n]

          pass[#pass + 1] = p

        Vector pass

      when "matrix"
        assert other.cols == @cols and other.rows == @rows, "Can't operate matrices of different dimensions!"
        Matrix\from @rows, @cols, @content / other.content

  @from: (@rows, @cols, @content) =>
    @type    = "matrix"
