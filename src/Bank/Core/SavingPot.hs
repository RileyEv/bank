module Bank.Core.SavingPot where

import           Bank.Core.Common (Balance)

data SavingPot = forall pot. (BankSavingPot pot, Show pot) => SavingPot pot

instance Show SavingPot where
  show (SavingPot pot) = show pot

class BankSavingPot pot where
  getPotBalance :: pot -> IO (Maybe Balance)
