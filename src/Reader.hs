{-|
Module      : Reader
Description : Holds environment variables.
Copyright   : (c) IOcrafts, 2024-present
License     : BSD
Maintainer  : Maurizio Dusi
Stability   : stable
Portability : POSIX

This module holds the environment variables used by the program.
-}

module Reader
    ( Env (..)
    , ReaderIO
    ) where

import           Control.Monad.Reader ( ReaderT )


-- | Represents the environment configuration for the SFTP client.
data Env
  = Env { hostName           :: String
          -- ^ The hostname of the SFTP server.
        , port               :: Int
          -- ^ The port number to connect to.
        , user               :: String
          -- ^ The username for authentication.
        , password           :: String
          -- ^ The password for authentication.
        , knownHosts         :: FilePath
          -- ^ The path to the known hosts file.
        , transferFrom       :: FilePath
          -- ^ The source file path for transfer.
        , transferTo         :: FilePath
          -- ^ The destination file path for transfer.
        , transferExtensions :: [String]
          -- ^ The list of file extensions to transfer.
        , archiveTo          :: Maybe FilePath
          -- ^ Optional path to archive transferred files.
        , date               :: Integer
          -- ^ The date for filtering files to transfer.
        , noOp               :: Bool
          -- ^ Whether or not to perform the actual transfer.
        }

type ReaderIO = ReaderT Env IO
