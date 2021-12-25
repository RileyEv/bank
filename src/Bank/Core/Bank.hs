module Bank.Core.Bank where

import Bank.Core.Account (Account)

newtype HolderDetails = HolderDetails
  {
    name        :: String
  , address     :: String
  , dateOfBirth :: String
  }

class Bank b where
  getAccounts :: Account a => b -> [a]
  holderDetails :: b -> HolderDetails
