From Coq Require Import ssreflect.
Require Import Bool.
Require Import ZArith.


Parameters T S : Type.
Parameter eqbT : T -> T -> bool.

Notation "x == y" := (eqbT x y) (at level 50, left associativity).
Notation "x != y" := (negb (eqbT x y)) (at level 50, left associativity).

Definition SwitchBlock (b : bool) (x y : T) := if b then x else y.

Inductive simple_state :=
| S0 : bool -> bool -> state
| S1 : bool -> state
| S2 : bool -> state.

