# BetaReader.jl

Transliterate Beta Code Greek to Unicode Greek.

This library is coordinated with the functionality of the Javascript [BetaReader.js](https://github.com/Eumaeus/BetaReader.js) library.


[![Generic badge](https://img.shields.io/badge/version-2.0-green.svg)](https://shields.io/)

## Using

- `julia> ]` (activate command-mode)
- `pkg> activate .`
- `julia> using BetaReader`
- `julia> BetaReader.transcodeGreek("mh=nin a)/eide")`

## Coverage & Reference

The official Beta Code manual is [here](https://stephanus.tlg.uci.edu/encoding/BCM.pdf). This library does not intend to cover that in full.

This repository includes a complete reference guide in both Markdown and as a PDF.

To generate a reference guide from the code:

- `julia> usingBetaReader` (if you haven't already done that)
- `julia> println(BetaReader.printReferenceGuide())`