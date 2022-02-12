module Bank.Core.Account where

import           Bank.Core.Common    (AccountDetails, AccountIdentifiers,
                                      Balance)
import           Bank.Core.SavingPot (SavingPot)

-- data Features = DirectDebits | SavingPot | StandingOrder | FastPayments

-- class Account a where
--   supportedFeatures :: a -> [Features]
--   getDirectDebits :: DirectDebit dd => a -> IO [dd]
--   getStandingOders :: StandingOrder so => a -> IO [so]
--   getSavingPots :: SavingPot sp => a -> IO [sp]

class BankAccount a where
  getDetails :: a -> IO (Maybe AccountDetails) -- TODO
  getIdentifiers :: a -> IO (Maybe AccountIdentifiers) -- TODO
  getAccountBalance :: a -> IO (Maybe Balance)
  getSavingsPots :: a -> IO (Maybe [SavingPot]) -- If they don't exist on the account just return []

data Account = forall a. (BankAccount a, Show a) => Account a

instance Show Account where
  show (Account a) = show a
