{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE ViewPatterns #-}

module Main where

import Control.Applicative ((<$>))

import Test.QuickCheck

import Data.Frequency.Hertz
import Data.Frequency.Megahertz

import System.Exit

instance Arbitrary Hertz where
  arbitrary = Hertz <$> arbitrary

instance Arbitrary Megahertz where
  arbitrary = Megahertz <$> arbitrary

prop_HasFrequencyEq1 :: (Eq a, HasFrequency a) => a -> Bool
prop_HasFrequencyEq1 x = (fromHertz . toHertz $ x) == x

-- TODO: Second law.

main :: IO ()
main = mapM quickCheckResult tests >>= \x -> case filter (not . passed) x of
    [] -> exitSuccess
    _ -> exitFailure
  where
    passed Success{} = True
    passed _ = False

tests :: [Property]
tests =
  [ property (prop_HasFrequencyEq1 :: Hertz -> Bool)
  , property (prop_HasFrequencyEq1 :: Megahertz -> Bool)
  ]
