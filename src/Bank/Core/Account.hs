module Bank.Core.Account where

import Bank.Core.DirectDebit   (DirectDebit)
import Bank.Core.StandingOrder (StandingOrder)
import Bank.Core.SavingPot     (SavingPot)


data Features = DirectDebits | SavingPot | StandingOrder | FastPayments

class Account a where
  supportedFeatures :: a -> [Features]
  getDirectDebits :: DirectDebit dd => a -> IO [dd]
  getStandingOders :: StandingOrder so => a -> IO [so]
  getSavingPots :: SavingPot sp => a -> IO [sp]
