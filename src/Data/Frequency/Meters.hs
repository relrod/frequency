{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Data.Frequency.Meters where

newtype Meters = Meters { getMeters :: Double }
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

class HasMeters a where
  toMeters :: a -> Meters

instance HasMeters Meters where
  toMeters = id
