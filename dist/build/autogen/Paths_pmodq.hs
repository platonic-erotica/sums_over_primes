module Paths_pmodq (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/home/providence/.cabal/bin"
libdir     = "/home/providence/.cabal/lib/pmodq-0.1.0.0/ghc-7.6.3"
datadir    = "/home/providence/.cabal/share/pmodq-0.1.0.0"
libexecdir = "/home/providence/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "pmodq_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "pmodq_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "pmodq_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "pmodq_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
