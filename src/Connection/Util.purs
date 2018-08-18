module Connection.Util where

import Connection.Types
import Control.Bind (join)
import Control.Monad.Error.Class (throwError)
import Data.Array (last)
import Data.Array.NonEmpty (NonEmptyArray, toArray)
import Data.Either (Either)
import Data.Maybe (Maybe(..))
import Data.Traversable (traverse)
import Prelude (pure, ($))

username :: String -> Username 
username = Username 

password :: String -> SecretToken -> Password
password = Password 

secretToken :: String -> SecretToken
secretToken = SecretToken

clientSecret :: String -> ClientSecret
clientSecret = Secret 

clientId :: String -> ClientId
clientId = ClientId

getXmlElVal :: forall t. Maybe (NonEmptyArray (Maybe t)) → Maybe t
getXmlElVal val = join $ join $ last $ (traverse toArray val) 

maybeToEither :: forall e a. Maybe a -> e -> Either e a 
maybeToEither Nothing err = throwError err
maybeToEither (Just x) _  = pure x