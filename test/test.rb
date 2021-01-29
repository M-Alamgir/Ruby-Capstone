def get_numbers(list, index = 0, taken = [])
  return [taken] if index == list.size

  get_numbers(list, index + 1)
  get_numbers(list, index + 1 + [list[index]])
end

get_numbers([1, 2])

a = [1, 2]

a.each { |val| p val }

def get_numbers_stack(list)
  stack = [[0, []]]
  output = []
  until stack.empty?
    index, taken = stack.pop
    output << taken if index == list.size
    stack.unshift [index + 1, taken]
    stack.unshift [index + [list[index]]]
  end
  output
end
