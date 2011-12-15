{-# LANGUAGE OverloadedStrings #-}

module Database.Redis.ManualCommands where

import Control.Applicative
import Data.ByteString
import Database.Redis.Types
import Database.Redis.Internal

-- |@type@ is a keyword in Haskell, hence the command is renamed to 'getType'.
getType :: (RedisStatus a)
        => ByteString -- ^ key
        -> Redis (Maybe a)
getType key = decodeStatus <$> sendRequest ["TYPE", key]