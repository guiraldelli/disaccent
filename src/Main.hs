{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Data.Maybe              (fromJust)
import qualified Data.Text               as T'
import qualified Data.Text.Format        as F
import qualified Data.Text.ICU.Char      as C
import qualified Data.Text.ICU.Normalize as N
import qualified Data.Text.Lazy          as T
import qualified Data.Text.Lazy.IO       as TIO

main :: IO ()
main = TIO.interact process
-- main = TIO.putStrLn $ process "Miglė Šaslykai Ąžuolas ḇ Erdős Möbius"

process :: T.Text -> T.Text
process = T.unlines . map escapeLatex . T.lines

escapeLatex :: T.Text -> T.Text
escapeLatex = T.concatMap escapeChar

escapeChar :: Char -> T.Text
escapeChar c =
    let t = T.singleton c
    in
        if C.blockCode c == C.BasicLatin
        then t
        else let n = T.pack . T'.unpack $ N.normalize N.NFD ((T'.pack . T.unpack) t)
                 code = T.singleton . fromJust $ lookup (T.last n) escapedCodes
             in if T.length n == 1
                then t
                else format code (T.init n)

format :: T.Text -> T.Text -> T.Text
format code toEscape = F.format "\\{}{{}}" (code, toEscape)

escapedCodes :: [(Char, Char)]
escapedCodes =
    [ ('\768', '`')
    , ('\769', '\'')
    , ('\770', '^')
    , ('\776', '"')
    , ('\779', 'H')
    , ('\771', '~')
    , ('\807', 'c')
    , ('\808', 'k')
    , ('\772', '=')
    , ('\817', 'b')
    , ('\775', '.')
    , ('\803', 'd')
    , ('\778', 'r')
    , ('\774', 'u')
    , ('\780', 'v')
    ]
