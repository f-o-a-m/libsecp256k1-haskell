module Main where

import qualified Crypto.Secp256k1Prop as Secp256k1Prop
import GHC.IO.Encoding (setLocaleEncoding, utf8)
import Hedgehog (checkSequential)
import Hedgehog.Main
import qualified Spec
import Test.Hspec.Formatters
import Test.Hspec.Runner (Config (..), defaultConfig, hspecWith)


main :: IO ()
main = do
    setLocaleEncoding utf8
    hspecWith defaultConfig{configFormatter = Just progress} Spec.spec
    defaultMain $
        [ checkSequential Secp256k1Prop.tests
        ]