module CoalarSpec (spec) where

  import Coalar.Core.Expr
  import Test.Hspec
  import Test.Hspec.QuickCheck

  spec::Spec

  spec = describe "coalar" $ do
      it "returns Expr" $ do
        Operator Plus (Integer 1) (Integer 1)  `shouldBe` Operator Plus (Integer 1) (Integer 1)
