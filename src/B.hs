{-# LANGUAGE TemplateHaskell #-}

module B where

import A
import Foreign.Storable
import Language.Haskell.TH
import Language.Haskell.TH.Syntax

runQ $ do
  x <- runIO $ peek __answer

  [d| answer :: Int
      answer = $(lift x)
    |]

