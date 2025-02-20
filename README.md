# BetaReader.jl

A [Julia](https://julialang.org) library for transliterating Ancient Greek from [Beta Code](https://stephanus.tlg.uci.edu/encoding/BCM.pdf) to Unicode, from Unicode to Beta Code, and from either Beta Code or Unicode to a transliteration in Latin characters.

The Beta Code → Unicode function is coordinated with the functionality of the Javascript [BetaReader.js](https://github.com/Eumaeus/BetaReader.js) library. (That library handles only the transliteration from Beta Code to Unicode.)

[![version 2.2.3](https://img.shields.io/badge/version-2.2-blue.svg)](https://shields.io/) [![585 tests](https://img.shields.io/badge/tests-585-teal.svg)](https://shields.io/)

## Using

Having installed Julia and navigated to this respository's directory…

- `% julia` (start Julia)
- `julia> ]` (activate command-mode)
- `pkg> activate .`
- `julia> using BetaReader`
- `julia> BetaReader.betaToUnicode("mh=nin a)/eide")`
- `julia> BetaReader.unicodeToBeta("μῆνιν ἄειδε θεά")`
- `julia> BetaReader.unicodeToLatinUnicode("μῆνιν ἄειδε θεά")`
- `julia> BetaReader.betacodeToLatinUnicode("mh=nin a)/eide")`

**N.b.** This release is includes breaking changes. The former function `transcodeGreek()` is now `betaToUnicode()`.

## Testing

Run the unit tests like this:

- `julia> ]` (activate command-mode)
- `pkg> activate .`
- `pkg> test`

## Tutorial

This repository includes a tutorial in the form of a [Pluto notebook](https://plutojl.org), at `notebooks/Tutorial.jl`.

## Coverage & Reference

The official Beta Code manual is [here](https://stephanus.tlg.uci.edu/encoding/BCM.pdf). This library does not intend to cover that in full.

This repository includes a complete reference guide in both Markdown and as a PDF.

To generate a reference guide from the code:

- `julia> usingBetaReader` (if you haven't already done that)
- `julia> println(BetaReader.printReferenceGuide())`
