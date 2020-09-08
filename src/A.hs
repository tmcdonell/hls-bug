{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell          #-}
{-# OPTIONS_GHC -fobject-code #-} -- (1)

-- NOTE: Both (1) and (2) are required to build this package in both
-- regular mode as well as load it in ghci.

module A where

import Data.Int
import Foreign.Ptr
import Language.Haskell.TH
import Language.Haskell.TH.Syntax

foreign import ccall "&__answer" __answer :: Ptr Int32

runQ $ do
  addForeignFilePath LangC "cbits/answer.c" -- (2)
  return []

