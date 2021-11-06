let Number   = (n) => (env) => n
let Variable = (s) => (env) => env[s]
let Add      = (e1, e2) => (env) => e1(env) + e2(env)
let Multiply = (e1, e2) => (env) => e1(env) * e2(env)

let environment = {a: 3, b: 4}
let expression  = Add(Variable('a'), Multiply(Number(2), Variable('b')))

console.log(expression(environment))
