(use '[clojure.core.match :only [match]])

(defn evaluate [env [sym x y]]
  (match [sym]
    ['Number]   x
    ['Add]      (+ (evaluate env x) (evaluate env y))
    ['Multiply] (* (evaluate env x) (evaluate env y))
    ['Variable] (env x)))
    
(def environment {"a" 3, "b" 4, "c" 5})

(def expression-tree '(Add (Variable "a") (Multiply (Number 2) (Variable "b"))))

(def result (evaluate environment expression-tree)) 