{-# LANGUAGE DuplicateRecordFields #-}

module Bank.Core.Common where

import           Data.Aeson   (FromJSON (..), ToJSON (..))
import           GHC.Generics (Generic)

data Currency = AED | AFN | ALL | AMD | ANG | AOA | ARS | AUD | AWG | AZN | BAM | BBD | BDT | BGN | BHD | BIF | BMD | BND | BOB | BOV | BRL | BSD | BTN | BWP | BYN | BYR | BZD | CAD | CDF | CHE | CHF | CHW | CLF | CLP | CNY | COP | COU | CRC | CUC | CUP | CVE | CZK | DJF | DKK | DOP | DZD | EGP | ERN | ETB | EUR | FJD | FKP | GBP | GEL | GHS | GIP | GMD | GNF | GTQ | GYD | HKD | HNL | HRK | HTG | HUF | IDR | ILS | INR | IQD | IRR | ISK | JMD | JOD | JPY | KES | KGS | KHR | KMF | KPW | KRW | KWD | KYD | KZT | LAK | LBP | LKR | LRD | LSL | LTL | LYD | MAD | MDL | MGA | MKD | MMK | MNT | MOP | MRO | MRU | MUR | MVR | MWK | MXN | MXV | MYR | MZN | NAD | NGN | NIO | NOK | NPR | NZD | OMR | PAB | PEN | PGK | PHP | PKR | PLN | PYG | QAR | RON | RSD | RUB | RUR | RWF | SAR | SBD | SCR | SDG | SEK | SGD | SHP | SLL | SOS | SRD | SSP | STD | STN | SVC | SYP | SZL | THB | TJS | TMT | TND | TOP | TRY | TTD | TWD | TZS | UAH | UGX | USD | USN | USS | UYI | UYU | UZS | VEF | VES | VND | VUV | WST | XAF | XAG | XAU | XBA | XBB | XBC | XBD | XCD | XDR | XOF | XPD | XPF | XPT | XSU | XTS | XUA | XXX | YER | ZAR | ZMW | ZWL deriving
    ( FromJSON
    , Generic
    , Show
    , ToJSON
    )

data CurrencyAndAmount = CurrencyAndAmount
                           { currency   :: Currency
                           , minorUnits :: Int
                           }
  deriving (FromJSON, Generic, Show, ToJSON)

data Balance = Balance
                 { clearedBalance        :: CurrencyAndAmount -- excl pots
                 , effectiveBalance      :: CurrencyAndAmount -- excl pots
                 , totalClearedBalance   :: CurrencyAndAmount -- incl pots
                 , totalEffectiveBalance :: CurrencyAndAmount -- incl pots
                 , pendingTransactions   :: CurrencyAndAmount
                 , acceptedOverdraft     :: CurrencyAndAmount
                 }
  deriving (Show)

data AccountDetails = AccountDetails
                        { name       :: String
                        , holderName :: String
                        , currency   :: Currency
                        }
  deriving (Show)

newtype SortCode = SortCode String
  deriving (Show)

newtype AccountNumber = AccountNumber String
  deriving (Show)

data AccountIdentifiers = AccountIdentifiers
                            { accountIdentifier :: String
                            , bankIdentifier    :: String
                            }
  deriving (Show)
