module JSON.AST where

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
-- you can use "Unsafe.Coerce.unsafeCoerce" to work with it,
-- thus sidestepping the redundant conversions.
data JSON =
  Object !(HashMap Text JSON) |
  Array !(Vector JSON) |
  String !Text |
  Number !Scientific |
  Bool !Bool |
  Null
  deriving (Eq, Read, Show, Typeable, Data)
