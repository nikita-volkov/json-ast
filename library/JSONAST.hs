-- |
-- This module contains no namespace conflicts with Prelude,
-- so it can be imported unqualified.
module JSONAST where

import Prelude
import Data.Data (Data, Typeable)
import Data.HashMap.Strict (HashMap)
import Data.Vector (Vector)
import Data.Text (Text)
import Data.Scientific (Scientific)


-- |
-- A JSON value AST.
-- 
-- Note that this datastructure is identical to \"aeson\" Value.
-- Until \"aeson\" implements the dependency on \"json-ast\",
-- you can use 'Unsafe.Coerce.unsafeCoerce' to work with it,
-- thus sidestepping the redundant conversions.
data JSON =
  JSON_Object !(HashMap Text JSON) |
  JSON_Array !(Vector JSON) |
  JSON_String !Text |
  JSON_Number !Scientific |
  JSON_Bool !Bool |
  JSON_Null
  deriving (Eq, Read, Show, Typeable, Data)
