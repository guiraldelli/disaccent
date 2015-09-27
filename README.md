# `disaccent`
`disaccent` is a tool for converting diacritical marks (AKA *accent marks*) from plain text to the respective [escaped LaTeX](https://en.wikibooks.org/wiki/LaTeX/Special_Characters#Escaped_codes) version.

It is written in [Haskell(https://www.haskell.org/) and licensed under [BSD 2-clause](https://www.tldrlegal.com/l/freebsd).

## Usage
`disaccent` is a standard command-line tool that process the [standard input stream (`STDIN`)](https://en.wikipedia.org/wiki/Standard_streams#Standard_input_.28stdin.29).

## What about `unicode2latex`?
`unicode2latex` is an equivalent tool that I have written few years ago, in Python. It is functional and can be downloaded in [its own repository](https://github.com/guiraldelli/unicode2latex).

Concerning the stability, it is more stable than `disaccent`, but I hope the situation will change very soon. :smile:

In source-code readability, however, I think `disaccent` is much superior than `unicode2latex`, but that is a matter of taste (I think so). :stuck_out_tongue_winking_eye:
