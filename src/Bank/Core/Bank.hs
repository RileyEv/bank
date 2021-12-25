module Bank.Core.Bank where

import Bank.Core.Account (Account)

newtype HolderDetails = HolderDetails
  {
    name        :: String
  , address     :: String
  , dateOfBirth :: String
  }

class Bank b where
  getAccounts :: Account a => b -> IO [a]
  holderDetails :: b -> IO HolderDetails
