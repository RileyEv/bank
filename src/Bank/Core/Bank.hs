module Bank.Core.Bank where

import           Bank.Core.Account (Account)

data HolderDetails = HolderDetails
                       { name        :: String
                       , address     :: String
                       , dateOfBirth :: String
                       }

class Bank b where
  getAccounts :: b -> IO (Maybe [Account])
