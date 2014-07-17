{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Data.Frequency.Megahertz where

import Data.Frequency.Hertz
import Data.Frequency.Meters

newtype Megahertz = Megahertz { getMegahertz :: Double }
                  deriving ( Enum
                           , Eq
                           , Floating
                           , Fractional
                           , Num
                           , Ord
                           , Read
                           , Real
                           , RealFrac
                           , Show
                           )

instance HasFrequency Megahertz where
  toHertz (Megahertz x) = Hertz $ x * 1000000
  fromHertz (Hertz x) = Megahertz $ x / 1000000

instance HasMeters Megahertz where
  toMeters = toMeters . toHertz
