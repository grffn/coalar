module Coalar.Core.Expr(Op, Number, Expr) where

import qualified Data.Map   as Map
import           Data.Maybe

data Op = Plus | Minus | Div | Mult | Pow deriving (Eq)

instance Show Op where
  show Plus = "+"
  show Minus = "-"
  show Div = "/"
  show Mult = "*"
  show Pow = "^"


data Number = Rational Rational | Integer Integer deriving (Eq)

instance Show Number where
  show (Rational a) = show a
  show (Integer a) = show a

data Expr = Number Number
            | Symbol String
            | Operator Op [Expr]

instance Show Expr where
  show (Number a) = show a
  show (Symbol s) = s
  show (Operator op exprs) = foldl (\e1 e2 -> concat ["(", show e1, show op, show e2, ")"]) "" exprs

instance Num Expr where
  a + b = Operator Plus [a, b]
  a - b = Operator Minus [a, b]
  a * b = Operator Mult [a, b]
  fromInteger a= Number (Integer a)


subs :: Expr -> Map.Map String Expr -> Expr

subs (Number a) _ = Number a
subs (Symbol s) m = fromMaybe (Symbol s) (Map.lookup s m)
subs (Operator op exprs) m = Operator op (map (`subs` m) exprs)
