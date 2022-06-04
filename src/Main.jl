# Functions for identifying classes of characters

"Returns `true ` if a given character is a beta-code breathing."
function isBreathing(c)
    breathings = "()"
    if (contains(breathings, c))
        true
    else
        false
    end
end

"Returns `true ` if a given character is a beta-code acute, grave, *or* circumflex."
function isAccent(c)
    accents = "/\\="
    if (contains(accents, c))
        true
    else
        false
    end
end

"Returns `true ` if a given character is a beta-code iota-subscript."
function isIotaSubscript(c)
    if (c == "|") true
    else false
    end
end

"Returns `true ` if a given character is a beta-code diaeresis."
function isDiaeresis(c)
    if (c == "+") true
    else false
    end
end

"Returns `true ` if a given character is a beta-code version of any diacritical mark."
function isDiacritical(c)
    if isAccent(c) true
    elseif isBreathing(c) true
    elseif isDiaeresis(c) true
    elseif isIotaSubscript(c) true
    else false
    end
end


"Returns `true ` if a given character is a beta-code version of any punctuation mark."
function isPunctuation(c)
    puncts = """,."';[]-—: """
    if (contains(puncts,c)) true
    else false
    end
end

"Returns `true ` if a given character is a beta-code version of any valid lower-case consonant."
function isValidLCConsonant(c)
    validLCConsonants = "bgdzqklmncpstfxy"
    if (contains(validLCConsonants,c)) true
    else false
    end
end

"Returns `true ` if a given character is a beta-code version of any character that would cause a sigma to take its terminal form."
function isSigmaTerminator(c)
    sigmaTerms = """,.":;— \t\n"""
    if (contains(sigmaTerms, c   )) true
    else false
    end
end

"Returns `true ` if a given character is a beta-code version of any valid upper-case consonant."
function isValidUCConsonant(c)
    validUCConsonants = "BGDZQKLMNCPSTFXY"
    if (contains(validUCConsonants,c)) true
    else false
    end
end

"Returns `true ` if a given character is a beta-code version of any valid consonant, upper- or lower-case."
function isConsonant(c)
    if (isValidUCConsonant(c)) true
    elseif (isValidLCConsonant(c)) true
    else false
    end
end


"Returns `true ` if a given character is a beta-code version of any valid lower-case vowel. Rho counts as a vowel here, because it can take a breathing."
function isValidLCVowel(c)
    validLCVowels = "aehiouwr"
    if (contains(validLCVowels, c)) true
    else false
    end
end

"Returns `true ` if a given character is a beta-code version of any valid upper-case vowel. Rho counts as a vowel here, because it can take a breathing."
function isValidUCVowel(c)
    validUCVowels = "AEHIOUWR"
    if (contains(validUCVowels, c)) true
    else false
    end
end

"Returns `true ` if a given character is a beta-code version of any valid upper-case letter."
function isUC(c)
    if (isValidUCConsonant(c)) true
    elseif (isValidUCVowel(c)) true
    else false
    end
end


"Returns `true ` if a given character is a beta-code version of any valid vowel, upper- or lower-case."
function isVowel(c)
    if isValidUCVowel(c) true
    elseif isValidLCVowel(c) true
    else false
    end
end

"Returns `true ` if a given character is a the asterix that, in original beta-code, indicated that the following letter is upper-case."
function isUCMarker(c)
    if c == "*" true
    else false
    end
end

"Returns `true ` if a given string represents a valid beta-code expression of a Greek diphthong."
function isDiphthong(s)
    allDiphthongs = ["ai", "ei", "oi", "ui", "au", "eu", "hu", "ou", "Ai", "Ei", "Oi", "Ui", "Au", "Eu", "Hu", "Ou"]
    if (s in(allDiphthongs)) true
    else false
    end
end

"Called by `transcode()`, this recursively walks through a string and transliterates beta-code to unicode, using the `resolve()` function. `s` is the string you want to transliterate; `acc` and `ret` are empty strings when it is first called."
function accumulate(s::String, acc::String, ret::String)

    # When we're done, an all characters in the original `s` have been treated, `s` will be empty, so we return `ret`. Invalid characters will be transliterated to `#`.
    if (length(s) == 0) return ret
    # Before we're done…
    else
        charVec = split(s, "")
        firstChar = popfirst!(charVec)
        # We need the second characters, for handling sigmas and the `*` form of upper-case.
        secondChar = begin 
            if (length(charVec) < 1) ""
            else charVec[1]
            end
        end

        # Handle medial and terminal sigmas
        if (firstChar == "s")
            if (isSigmaTerminator(secondChar))
                # No need to be fancy, just stick a terminal sigma in there.
                newAcc = acc * "ς"
                # Iterate
                accumulate(join(charVec),newAcc,newAcc)
            else
                # Sigma is transliterated by default to the medial form
                newAcc = acc * resolve(firstChar)
                # Iterate
                accumulate(join(charVec),newAcc,newAcc)
            end
        # Handle the `*` form of upper-case letters
        elseif (isUCMarker(firstChar)) 
            # Asterisk as a stand-alone character is not valid.
            if (length(charVec) < 1)
                # Iterate 
                newAcc = acc * "#"
                accumulate(join(charVec),newAcc,newAcc) 
            # Handle it…
            else
                # We don't need the asterisk any more
                trashAsterix = popfirst!(charVec)
                # resolve the lower-case version of the character after the asterisk (we grabbed it into `secondChar` above)
                resolvedLC = resolve(lowercase(secondChar))
                # Take advantage of the `Unicode` library to upper-case the result
                resolvedUC = uppercase(resolvedLC)
                # Iterate
                newAcc = acc * resolvedUC
                accumulate(join(charVec),newAcc,newAcc)
            end
        elseif (isUC(firstChar))
            # Rather than having a lookup dictionary twice as long as needed, we use our functions, and the affordances of `Unicode` to work around it.
            # Whatever it is, lower-case it and resolve…
            resolvedLC = resolve(lowercase(firstChar))
            # Then upper-case it
            resolvedUC = uppercase(resolvedLC)
            # Iterate
            newAcc = acc * resolvedUC
            accumulate(join(charVec),newAcc,newAcc) 
        else
            # Fall-through default: resolve and iterate
            newAcc = acc * resolve(firstChar)
            accumulate(join(charVec),newAcc,newAcc)
        end
            
                
    end

end

"Simply look up `s` in `BetaReader.bigLookup`, in file `CharDict.jl`. If the lookup failes, return the invalid-beta-code sign `#`."
function resolve(s)
    get(bigLookup, s, "#")
end

"Initialize the iteratore, `accumulate()`; get the final result, which will be using combining diacritics; then normalize to `:NFKC`, using pre-combined diacritics."
function transcode(s)
    preString = accumulate(s, "", "")
    Unicode.normalize(preString, :NFKC)
end

#=
"Generate a Markdown table showing all valid vowels"
function printVowels()
    header = """##Valid Vowels##\n\n| Greek Character | Beta-Code |\n|-----------------|-----------|"""

    justVowels = collect(filter(k -> isVowel(k.first), bigLookup))

    for (g, b) in justVowels
        newLine = "\n| $g | $b |"
        vowelMd = vowelMd * newLine
    end        
    vowelMd

end
=#