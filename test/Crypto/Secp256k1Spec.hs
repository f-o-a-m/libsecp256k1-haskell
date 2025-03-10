module Crypto.Secp256k1Spec (spec) where

-- import Control.Monad.Par
-- import qualified Control.Monad.Par as P
import Crypto.Secp256k1
import qualified Data.ByteString as BS
import qualified Data.ByteString.Char8 as B8
import Data.Either (fromRight)
import Data.Maybe (fromMaybe, isNothing)
import Data.String (fromString)
import Test.HUnit (Assertion, assertEqual)
import Test.Hspec


spec :: Spec
spec = do
    pure ()

--     describe "tweaks" $ do
--         it "add secret key" tweakAddSecKeyTest
--         it "multiply secret key" tweakMulSecKeyTest
--         it "add public key" tweakAddPubKeyTest
--         it "multiply public key" tweakMulPubKeyTest
--         it "combine public keys" combinePubKeyTest
--         it "can't combine 0 public keys" combinePubKeyEmptyListTest
--         it "negates tweak" negateTweakTest

-- hexToBytes :: String -> BS.ByteString
-- hexToBytes = fromRight undefined . decodeBase16 . B8.pack

-- showReadTweak :: SecKey -> Bool
-- showReadTweak k = showRead t
--     where
--         t = tweak $ getSecKey k

-- showReadSig :: (SecKey, Msg) -> Bool
-- showReadSig (k, m) = showRead sig
--     where
--         sig = signMsg k m

-- showRead :: (Show a, Read a, Eq a) => a -> Bool
-- showRead x = read (show x) == x

-- signMsgTest :: (Msg, SecKey) -> Bool
-- signMsgTest (fm, fk) = verifySig fp fg fm
--     where
--         fp = derivePubKey fk
--         fg = signMsg fk fm

-- signMsgParTest :: [(Msg, SecKey)] -> Bool
-- signMsgParTest xs = P.runPar $ do
--     ys <- mapM (P.spawnP . signMsgTest) xs
--     and <$> mapM P.get ys

-- badSignatureTest :: (Msg, SecKey, PubKey) -> Bool
-- badSignatureTest (fm, fk, fp) = not $ verifySig fp fg fm
--     where
--         fg = signMsg fk fm

-- normalizeSigTest :: (Msg, SecKey) -> Bool
-- normalizeSigTest (fm, fk) = isNothing sig
--     where
--         fg = signMsg fk fm
--         sig = normalizeSig fg

-- serializePubKeyTest :: (PubKey, Bool) -> Bool
-- serializePubKeyTest (fp, b) =
--     case importPubKey $ exportPubKey b fp of
--         Just fp' -> fp == fp'
--         Nothing -> False

-- parSerializePubKeyTest :: [(PubKey, Bool)] -> Bool
-- parSerializePubKeyTest ps = runPar $ do
--     as <- mapM (spawnP . serializePubKeyTest) ps
--     and <$> mapM get as

-- serializeSigTest :: (Msg, SecKey) -> Bool
-- serializeSigTest (fm, fk) =
--     case importSig $ exportSig fg of
--         Just fg' -> fg == fg'
--         Nothing -> False
--     where
--         fg = signMsg fk fm

-- parSerializeSigTest :: [(Msg, SecKey)] -> Bool
-- parSerializeSigTest ms = runPar $ do
--     as <- mapM (spawnP . serializeSigTest) ms
--     and <$> mapM get as

-- serializeCompactSigTest :: (Msg, SecKey) -> Bool
-- serializeCompactSigTest (fm, fk) =
--     case importCompactSig $ exportCompactSig fg of
--         Just fg' -> fg == fg'
--         Nothing -> False
--     where
--         fg = signMsg fk fm

-- serializeSecKeyTest :: SecKey -> Bool
-- serializeSecKeyTest fk =
--     case secKey $ getSecKey fk of
--         Just fk' -> fk == fk'
--         Nothing -> False

-- tweakAddSecKeyTest :: Assertion
-- tweakAddSecKeyTest =
--     assertEqual "tweaked keys match" expected tweaked
--     where
--         tweaked = do
--             key <-
--                 secKey $
--                     hexToBytes
--                         "f65255094d7773ed8dd417badc9fc045c1f80fdc5b2d25172b031ce6933e039a"
--             twk <-
--                 tweak $
--                     hexToBytes
--                         "f5cbe7d88182a4b8e400f96b06128921864a18187d114c8ae8541b566c8ace00"
--             tweakAddSecKey key twk
--         expected =
--             secKey $
--                 hexToBytes
--                     "ec1e3ce1cefa18a671d51125e2b249688d934b0e28f5d1665384d9b02f929059"

-- tweakMulSecKeyTest :: Assertion
-- tweakMulSecKeyTest =
--     assertEqual "tweaked keys match" expected tweaked
--     where
--         tweaked = do
--             key <-
--                 secKey $
--                     hexToBytes
--                         "f65255094d7773ed8dd417badc9fc045c1f80fdc5b2d25172b031ce6933e039a"
--             twk <-
--                 tweak $
--                     hexToBytes
--                         "f5cbe7d88182a4b8e400f96b06128921864a18187d114c8ae8541b566c8ace00"
--             tweakMulSecKey key twk
--         expected =
--             secKey $
--                 hexToBytes
--                     "a96f5962493acb179f60a86a9785fc7a30e0c39b64c09d24fe064d9aef15e4c0"

-- tweakAddPubKeyTest :: Assertion
-- tweakAddPubKeyTest =
--     assertEqual "tweaked keys match" expected tweaked
--     where
--         tweaked = do
--             pub <-
--                 importPubKey $
--                     hexToBytes
--                         "04dded4203dac96a7e85f2c374a37ce3e9c9a155a72b64b4551b0bfe779dd4470512213d5ed790522c042dee8e85c4c0ec5f96800b72bc5940c8bc1c5e11e4fcbf"
--             twk <-
--                 tweak $
--                     hexToBytes
--                         "f5cbe7d88182a4b8e400f96b06128921864a18187d114c8ae8541b566c8ace00"
--             tweakAddPubKey pub twk
--         expected =
--             importPubKey $
--                 hexToBytes
--                     "04441c3982b97576646e0df0c96736063df6b42f2ee566d13b9f6424302d1379e518fdc87a14c5435bff7a5db4552042cb4120c6b86a4bbd3d0643f3c14ad01368"

-- tweakMulPubKeyTest :: Assertion
-- tweakMulPubKeyTest =
--     assertEqual "tweaked keys match" expected tweaked
--     where
--         tweaked = do
--             pub <-
--                 importPubKey $
--                     hexToBytes
--                         "04dded4203dac96a7e85f2c374a37ce3e9c9a155a72b64b4551b0bfe779dd4470512213d5ed790522c042dee8e85c4c0ec5f96800b72bc5940c8bc1c5e11e4fcbf"
--             twk <-
--                 tweak $
--                     hexToBytes
--                         "f5cbe7d88182a4b8e400f96b06128921864a18187d114c8ae8541b566c8ace00"
--             tweakMulPubKey pub twk
--         expected =
--             importPubKey $
--                 hexToBytes
--                     "04f379dc99cdf5c83e433defa267fbb3377d61d6b779c06a0e4ce29ae3ff5353b12ae49c9d07e7368f2ba5a446c203255ce912322991a2d6a9d5d5761c61ed1845"

-- combinePubKeyTest :: Assertion
-- combinePubKeyTest =
--     assertEqual "combined keys match" expected combined
--     where
--         combined = do
--             pub1 <-
--                 importPubKey $
--                     hexToBytes
--                         "04dded4203dac96a7e85f2c374a37ce3e9c9a155a72b64b4551b0bfe779dd4470512213d5ed790522c042dee8e85c4c0ec5f96800b72bc5940c8bc1c5e11e4fcbf"
--             pub2 <-
--                 importPubKey $
--                     hexToBytes
--                         "0487d82042d93447008dfe2af762068a1e53ff394a5bf8f68a045fa642b99ea5d153f577dd2dba6c7ae4cfd7b6622409d7edd2d76dd13a8092cd3af97b77bd2c77"
--             pub3 <-
--                 importPubKey $
--                     hexToBytes
--                         "049b101edcbe1ee37ff6b2318526a425b629e823d7d8d9154417880595a28000ee3febd908754b8ce4e491aa6fe488b41fb5d4bb3788e33c9ff95a7a9229166d59"
--             combinePubKeys [pub1, pub2, pub3]
--         expected =
--             importPubKey $
--                 hexToBytes
--                     "043d9a7ec70011efc23c33a7e62d2ea73cca87797e3b659d93bea6aa871aebde56c3bc6134ca82e324b0ab9c0e601a6d2933afe7fb5d9f3aae900f5c5dc6e362c8"

-- combinePubKeyEmptyListTest :: Assertion
-- combinePubKeyEmptyListTest =
--     assertEqual "empty pubkey list must return Nothing" expected combined
--     where
--         expected = Nothing
--         combined = combinePubKeys []

-- negateTweakTest :: Assertion
-- negateTweakTest =
--     assertEqual "can recover secret key 1 after adding tweak 1" oneKey subtracted
--     where
--         Just oneKey =
--             secKey $
--                 fromRight undefined $
--                     decodeBase16 $
--                         B8.pack
--                             "0000000000000000000000000000000000000000000000000000000000000001"
--         Just oneTwk =
--             tweak $
--                 fromRight undefined $
--                     decodeBase16 $
--                         B8.pack
--                             "0000000000000000000000000000000000000000000000000000000000000001"
--         Just minusOneTwk = tweakNegate oneTwk
--         Just twoKey = tweakAddSecKey oneKey oneTwk
--         Just subtracted = tweakAddSecKey twoKey minusOneTwk
