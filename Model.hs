module Model where

import Prelude
import Yesod
import Yesod.Auth.HashDB (HashDBUser(..))
import Data.Text (Text)
import Database.Persist.Quasi
import Data.Time

-- You can define all of your database entities in the entities file.
-- You can find more information on persistent and how to declare entities
-- at:
-- http://www.yesodweb.com/book/persistent/
share [mkPersist sqlOnlySettings, mkMigrate "migrateAll"]
    $(persistFileWith lowerCaseSettings "config/models")

instance HashDBUser User where
   userPasswordHash = Just . userPassword
   userPasswordSalt = Just . userSalt
   setSaltAndPasswordHash s h u = u { userSalt     = s
                                    , userPassword = h
                                    }
