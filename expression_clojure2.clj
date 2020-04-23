(defn Add [x y] #(+ (x %) (y %)))
(defn Mul [x y] #(* (x %) (y %)))
(defn Var [x] #(x %))
(defn Num [x] (fn [_] x))

(def ast (Add (Var 'a) (Mul (Num 2) (Var 'b))))
(def env '{a 3 b 4 c 5})
(def result (ast env))