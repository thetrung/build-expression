indirect enum Expression {
    case Number(Int)
    case Add(Expression, Expression)
    case Multiply(Expression, Expression)
    case Variable(String)
}

func evaluate(env: [String: Int], _ expression: Expression) -> Int {
    switch expression {
    case let .Number(n): return n
    case let .Add(l, r): return evaluate(env, l) + evaluate(env, r)
    case let .Multiply(l, r): return evaluate(env, l) * evaluate(env, r)
    case .Variable(let name): return env[name] ?? 0
    }
}

let expressionTree: Expression = .Add(.Variable("a"), .Multiply(.Number(2), .Variable("b")))
let result = evaluate(["a": 3, "b": 4, "c": 7], expressionTree)