
def evaluate(env, exp)
  keyword, a, b = exp
  case keyword
  when :number;   a
  when :variable; env[a]
  when :add;      evaluate(env, a) + evaluate(env, b)
  when :multiply; evaluate(env, a) * evaluate(env, b)
  end
end

ExpressionTree = [:add, [:variable, :a], [:multiply, [:number, 2], [:variable, :b]]]
Env = { a: 3, b: 4, c: 5 }

puts evaluate(Env, ExpressionTree)
