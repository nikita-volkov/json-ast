{-|
This module will never contain any namespace conflicts with Prelude,
so it can be imported unqualified.
-}
module JsonAst where

import Prelude
import Data.Data (Data, Typeable)
import Data.HashMap.Strict (HashMap)
import Data.Vector (Vector)
import Data.Text (Text)
import Data.Scientific (Scientific)


{-|
JSON value abstract syntax tree.

It is intended to be used instead of \"aeson\" @Value@ as lingua franca
for JSON libraries, removing the need to depend on \"aeson\" when all you need
is a representation of a JSON value.

Note that this datastructure is representationally identical to \"aeson\" @Value@.
Meaning that conversions between them can be made at 0 performance cost,
(using the 'Unsafe.Coerce.unsafeCoerce' function).
The \"aeson-json-ast\" package provides a typed interface for such conversions.
-}
data Json =
  ObjectJson !(HashMap Text Json) |
  ArrayJson !(Vector Json) |
  StringJson !Text |
  NumberJson !Scientific |
  BoolJson !Bool |
  NullJson
  deriving (Eq, Read, Show, Typeable, Data)
