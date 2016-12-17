class Matrix
  new: (@rows, @cols, d) =>

    @content = Vector [d for i = 1, @rows * @cols]
    @type    = "matrix"

  __add: (other) =>
    switch other.type
      when "vector"
        assert @cols == #other.content, "Can't operate vector and matrix with wrong dimensions!"
        pass = {}

        for i = 1, #@content.content / @cols
          p = 0
          for n = 1, @cols
            p += @content.content[(i * @cols) + n - 2] + other.content[n]

          pass[#pass + 1] = p

        return Vector pass

      when "matrix"
        assert other.cols == @cols and other.rows == @rows, "Can't operate matrices of different dimensions!"
        Matrix\from @rows, @cols, @content + other.content

  __sub: (other) =>
    switch other.type
      when "vector"
        assert @cols == #other.content, "Can't operate vector and matrix with wrong dimensions!"
        pass = {}

        for i = 1, #@content.content / @cols
          p = 0
          for n = 1, @cols
            p += @content.content[(i * @cols) + n - 2] - other.content[n]

          pass[#pass + 1] = p

        return Vector pass

      when "matrix"
        assert other.cols == @cols and other.rows == @rows, "Can't operate matrices of different dimensions!"
        Matrix\from @rows, @cols, @content - other.content

  __mul: (other) =>
    switch other.type
      when "vector"
        assert @cols == #other.content, "Can't operate vector and matrix with wrong dimensions!"
        pass = {}

        for i = 1, #@content.content / @cols
          p = 0
          for n = 1, @cols
            p += @content.content[(i * @cols) + n - 2] * other.content[n]

          pass[#pass + 1] = p

        return Vector pass

      when "matrix"
        assert other.cols == @cols and other.rows == @rows, "Can't operate matrices of different dimensions!"
        Matrix\from @rows, @cols, @content * other.content

  __div: (other) =>
    switch other.type
      when "vector"
        assert @cols == #other.content, "Can't operate vector and matrix with wrong dimensions!"
        pass = {}

        for i = 1, #@content.content / @cols
          p = 0
          for n = 1, @cols
            p += @content.content[(i * @cols) + n - 2] / other.content[n]

          pass[#pass + 1] = p

        return Vector pass

      when "matrix"
        assert other.cols == @cols and other.rows == @rows, "Can't operate matrices of different dimensions!"
        Matrix\from @rows, @cols, @content / other.content

  @from: (@rows, @cols, @content) =>
    @type    = "matrix"
