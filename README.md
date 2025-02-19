# BetaReader.jl

A [Julia](https://julialang.org) library for transliterating Ancient Greek from [Beta Code](https://stephanus.tlg.uci.edu/encoding/BCM.pdf) to Unicode, from Unicode to Beta Code, and from either Beta Code or Unicode to a transliteration in Latin characters.

The Beta Code → Unicode function is coordinated with the functionality of the Javascript [BetaReader.js](https://github.com/Eumaeus/BetaReader.js) library.


[![version 2.2.2](https://img.shields.io/badge/version-2.2-blue.svg)](https://shields.io/) [![582 tests](https://img.shields.io/badge/tests-582-teal.svg)](https://shields.io/)

## Using

Having navigated to this respository's directory…

- `julia> ]` (activate command-mode)
- `pkg> activate .`
- `julia> using BetaReader`
- `julia> BetaReader.betaToUnicode("mh=nin a)/eide")`
- `julia> BetaReader.unicodeToBeta("μῆνιν ἄειδε θεά")`
- `julia> BetaReader.unicodeToLatinUnicode("μῆνιν ἄειδε θεά")`
- `julia> BetaReader.betacodeToLatinUnicode("mh=nin a)/eide")`


## Testing

Run the unit tests like this:

- `julia> ]` (activate command-mode)
- `pkg> activate .`
- `pkg> test`

## Coverage & Reference

The official Beta Code manual is [here](https://stephanus.tlg.uci.edu/encoding/BCM.pdf). This library does not intend to cover that in full.

This repository includes a complete reference guide in both Markdown and as a PDF.

To generate a reference guide from the code:

- `julia> usingBetaReader` (if you haven't already done that)
- `julia> println(BetaReader.printReferenceGuide())`