-- |
-- This module contains no namespace conflicts with Prelude,
-- so it can be imported unqualified.
module JsonAst where

import Prelude
import Data.Data (Data, Typeable)
import Data.HashMap.Strict (HashMap)
import Data.Vector (Vector)
import Data.Text (Text)
import Data.Scientific (Scientific)


-- |
-- JSON value abstract syntax tree.
-- 
-- Note that this datastructure is identical to \"aeson\" Value.
-- Until \"aeson\" implements the dependency on \"json-ast\",
-- you can use 'Unsafe.Coerce.unsafeCoerce' to work with it,
-- thus sidestepping the redundant conversions.
data Json =
  ObjectJson !(HashMap Text Json) |
  ArrayJson !(Vector Json) |
  StringJson !Text |
  NumberJson !Scientific |
  BoolJson !Bool |
  NullJson
  deriving (Eq, Read, Show, Typeable, Data)
