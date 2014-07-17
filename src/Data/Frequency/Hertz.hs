{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Data.Frequency.Hertz where

import Data.Frequency.Meters

newtype Hertz = Hertz { getHertz :: Double }
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

class Eq a => HasFrequency a where
  toHertz   :: a -> Hertz
  fromHertz :: Hertz -> a

instance HasFrequency Hertz where
  toHertz = id
  fromHertz = id

instance HasMeters Hertz where
  -- The constant below is the speed of light.
  toMeters (Hertz x) = Meters (299.792458 / x)
