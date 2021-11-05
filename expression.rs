use std::collections::HashMap;
use std::iter::FromIterator;
use Expression::{Number, Add, Multiply, Variable};

enum Expression {
    Number(i32),
    Add(Box<Expression>, Box<Expression>),
    Multiply(Box<Expression>, Box<Expression>),
    Variable(&'static str)
}

fn evaluate(env: &HashMap<&str, i32>, exp: Expression) -> i32 {
    match exp {
        Number(num) => num,
        Add(x, y) => evaluate(env, *x) + evaluate(env, *y),
        Multiply(x, y) => evaluate(env, *x) * evaluate(env, *y),
        Variable(id) =>
            *env.get(id).expect(&format!("variable not found: {}", id)),
    }
}

fn main() {
    let e: HashMap<&str, i32> = HashMap::from_iter(vec![("a", 1), ("b", 2)]);
    let tree = Add(Box::new(Variable("a")),
                   Box::new(Multiply(Box::new(Number(2)),
                                     Box::new(Variable("b")))));
    println!("{}", evaluate(&e, tree));
}
