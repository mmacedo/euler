euler = (problem) ->
  it 'should solve Euler problem in less than 2 minutes', () ->
    timeout = 2 * 60 * 1000
    start = new Date()
    result = undefined
    finished = false
    runs () ->
      setTimeout () ->
        result = problem()
        finished = true
      , 0
    waitsFor (() -> finished), "", timeout
    runs () ->
      elapsed = new Date() - start
      expect(finished).toBe(true)
      expect(elapsed).toBeLessThan(timeout)
      expect(result).not.toBeUndefined()

exports.euler = euler