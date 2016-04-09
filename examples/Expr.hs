module Main where

import Coalar.Core.Expr

main :: IO ()
main = do
  let e = Operator Plus (Integer 1) (Integer 1)
  putStrLn e
