# Functions for identifying classes of characters

"Returns `true ` if a given character is a beta-code breathing."
function isBreathing(c)
    breathings = "()"
    if (c == "") false
    elseif (contains(breathings, c))
        true
    else
        false
    end
end

"Returns `true ` if a given character is an Arabic numeral."
function isNumber(c)
    numbers = "0123456789"
    if (c == "") false
    elseif (contains(numbers, c))
        true
    else
        false
    end
end


"Returns `true ` if a given character is an editorial mark or critical sign."
function isEditorial(c)
    editorial = [ "#6"  , "#8"  , "#9"  , "#10" , "#11" , "#12" , "#13" , "#14" , "#15" , "#16" , "#17" , "#18" , "#19" , "#53", "?", "%", "%13", "%158", "%163", "#305", "?" ] 
    if (c == "") false
    elseif (c in editorial)
        true
    else
        false
    end
end

"Returns `true ` if a given character is an archaic form."
function isArchaic(c)
    archaic = ["#1","#2","#3","#4","#5", "#400"]
    if (c == "") false
    elseif (c in archaic)
        true
    else
        false
    end
end

"Returns `true` if a given character is a mathematical symbol."
function isMathematical(c)
    archaic = ["#150"]
    if (c == "") false
    elseif (c in archaic)
        true
    else
        false
    end
end

"Returns `true ` if a given character is a beta-code acute, grave, *or* circumflex."
function isAccent(c)
    accents = "/\\="
    if (c == "") false
    elseif (contains(accents, c))
        true
    else
        false
    end
end

"Returns `true ` if a given character is a beta-code iota-subscript."
function isIotaSubscript(c)
    if (c == "") false
    elseif (c == "|") true
    else false
    end
end

"Returns `true ` if a given character is a beta-code diaeresis."
function isDiaeresis(c)
    if (c == "") false
    elseif (c == "+") true
    else false
    end
end

"Returns `true ` if a given character is a beta-code version of any diacritical mark."
function isDiacritical(c)
    if (c == "") false
    elseif isAccent(c) true
    elseif isBreathing(c) true
    elseif isDiaeresis(c) true
    elseif isIotaSubscript(c) true
    else false
    end
end


"Returns `true ` if a given character is a beta-code version of any punctuation mark."
function isPunctuation(c)
    puncts = """,."';[]-—: #\t\n"""
    if (c == "") false
    elseif (contains(puncts,c)) true
    else false
    end
end

"Returns `true ` if a given character is a beta-code version of any valid lower-case consonant."
function isValidLCConsonant(c)
    validLCConsonants = "bgdzqklmncprstfxy"
    if (contains(validLCConsonants,c)) true
    elseif (c == "") false
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
    validUCConsonants = "BGDZQKLMNCPRSTFXY"
    if (c == "") false
    elseif (contains(validUCConsonants,c)) true
    else false
    end
end

"Returns `true ` if a given character is a beta-code version of any valid consonant, upper- or lower-case."
function isConsonant(c)
    if (c == "") false
    elseif (isValidUCConsonant(c)) true
    elseif (isValidLCConsonant(c)) true
    else false
    end
end


"Returns `true ` if a given character is a beta-code version of any valid lower-case vowel."
function isValidLCVowel(c)
    validLCVowels = "aehiouw"
    if (c == "") false
    elseif (contains(validLCVowels, c)) true
    else false
    end
end

"Returns `true ` if a given character is a beta-code version of any valid upper-case vowel."
function isValidUCVowel(c)
    validUCVowels = "AEHIOUW"
    if (c == "") false
    elseif (contains(validUCVowels, c)) true
    else false
    end
end

"Returns `true ` if a given character is a beta-code version of any valid upper-case letter."
function isUC(c)
    if (c == "") false
    elseif (isValidUCConsonant(c)) true
    elseif (isValidUCVowel(c)) true
    else false
    end
end


"Returns `true ` if a given character is a beta-code version of any valid vowel, upper- or lower-case."
function isVowel(c)
    if (c == "") false
    elseif isValidUCVowel(c) true
    elseif isValidLCVowel(c) true
    else false
    end
end

"Returns `true ` if a given character is a the asterix that, in original beta-code, indicated that the following letter is upper-case."
function isUCMarker(c)
    if (c == "") false
    elseif c == "*" true
    else false
    end
end

"Returns `true ` if a given character is a beta-code version of any valid alphabetic, upper- or lower-case."
function isAlphabetic(c)
    if (c == "") false
    elseif (isValidUCConsonant(c)) true
    elseif (isValidLCConsonant(c)) true
    elseif (isValidUCVowel(c)) true 
    elseif (isValidLCVowel(c)) true 
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

#= 

I'm sure the function below could be done very concisely with some bad-ass regular expression work. But not today, by me!

=#

"Called by `transcodeGreek()`, this recursively walks through a string and transliterates beta-code to unicode, using the `resolve()` function. `s` is the string you want to transliterate; `acc` and `ret` are empty strings when it is first called."
function accumulate(s::String, acc::String, ret::String, upperCaseThisOne::Bool = false)

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
        # Remember, for above and below, we've already "popped" the first char off! 
        thirdChar = begin
            if (length(charVec) < 2) ""
            else charVec[2]
            end 
        end
        # We only need to peek at the fourth char for some of those esoteric "#…" codes
        fourthChar = begin
            if (length(charVec) < 3) ""
            else charVec[3]
            end 
        end

        # Handle medial and terminal sigmas
        if (firstChar == "s")
            if (isSigmaTerminator(secondChar))
                # No need to be fancy, just stick a terminal sigma in there.
                newAcc = begin
                    if (upperCaseThisOne) acc * "Σ"
                    else acc * "ς"
                    end
                end
                # Iterate
                accumulate(join(charVec),newAcc,newAcc)
            else
                # Sigma is transliterated by default to the medial form
                newAcc = begin
                    if (upperCaseThisOne) acc * uppercase(resolve(firstChar))
                    else acc * resolve(firstChar)
                    end
                end
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
                accumulate(join(charVec), acc, ret, true)
            end

        # Handle the "#" codes, for funky letters and critical signs
        elseif (firstChar == "#")
            if (isNumber(secondChar) == false) # resolve "#" alone
                newAcc = acc * resolve(firstChar)
                if (length(charVec) < 1) 
                    newAcc # resolve and return!
                else
                    # Iterate
                    accumulate(join(charVec),newAcc,newAcc, upperCaseThisOne)
                end
            else
                if (isNumber(thirdChar) == false) # resolve "#" * secondChar
                    if (thirdChar != "") popfirst!(charVec) # get rid of the next char
                    end
                    resolvedChar = begin
                        if (upperCaseThisOne) uppercase(resolve("#" * secondChar))
                        else resolve("#" * secondChar)
                        end
                    end
                    newAcc = acc * resolvedChar
                    # Iterate
                    accumulate(join(charVec),newAcc,newAcc, false)
                else
                    if (isNumber(fourthChar) == false ) # resolve "#" + secondChar + thirdChar
                        popfirst!(charVec) # get rid of secondChar
                        popfirst!(charVec) # get rid of thirdChar
                        resolvedChar = begin
                            if (upperCaseThisOne) uppercase(resolve("#" * secondChar * thirdChar))
                                else resolve("#" * secondChar * thirdChar)
                            end
                        end
                        newAcc = acc * resolvedChar
                        # Iterate
                        accumulate(join(charVec),newAcc,newAcc, false)
                    else # resolve "#" + secondChar + thirdChar + fourthChar
                        popfirst!(charVec) # get rid of the next char
                        popfirst!(charVec) # get rid of the next char
                        popfirst!(charVec) # get rid of the next char
                        resolvedChar = begin
                            if (upperCaseThisOne) uppercase(resolve("#" * secondChar * thirdChar * fourthChar))
                            else resolve("#" * secondChar * thirdChar * fourthChar)
                            end
                        end
                        newAcc = acc * resolvedChar
                        # Iterate
                        accumulate(join(charVec),newAcc,newAcc, false)
                    end
                end
            end

        # Handle the "%" codes, for funky letters and critical signs
        elseif (firstChar == "%")
            if (isNumber(secondChar) == false) # resolve "%" alone
                newAcc = acc * resolve(firstChar)
                if (length(charVec) < 1) 
                    newAcc # resolve and return!
                else
                    # Iterate
                    accumulate(join(charVec),newAcc,newAcc, upperCaseThisOne)
                end
            else
                if (isNumber(thirdChar) == false) # resolve "%" * secondChar
                    if (thirdChar != "") popfirst!(charVec) # get rid of the next char
                    end
                    resolvedChar = begin
                        if (upperCaseThisOne) uppercase(resolve("%" * secondChar))
                        else resolve("%" * secondChar)
                        end
                    end
                    newAcc = acc * resolvedChar
                    # Iterate
                    accumulate(join(charVec),newAcc,newAcc, false)
                else
                    if (isNumber(fourthChar) == false ) # resolve "%" + secondChar + thirdChar
                        popfirst!(charVec) # get rid of secondChar
                        popfirst!(charVec) # get rid of thirdChar
                        resolvedChar = begin
                            if (upperCaseThisOne) uppercase(resolve("%" * secondChar * thirdChar))
                                else resolve("%" * secondChar * thirdChar)
                            end
                        end
                        newAcc = acc * resolvedChar
                        # Iterate
                        accumulate(join(charVec),newAcc,newAcc, false)
                    else # resolve "%" + secondChar + thirdChar + fourthChar
                        popfirst!(charVec) # get rid of the next char
                        popfirst!(charVec) # get rid of the next char
                        popfirst!(charVec) # get rid of the next char
                        resolvedChar = begin
                            if (upperCaseThisOne) uppercase(resolve("%" * secondChar * thirdChar * fourthChar))
                            else resolve("%" * secondChar * thirdChar * fourthChar)
                            end
                        end
                        newAcc = acc * resolvedChar                        # Iterate
                        accumulate(join(charVec),newAcc,newAcc, false)
                    end
                end
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
            newAcc = begin
                if (upperCaseThisOne) acc * uppercase(resolve(firstChar))
                else acc * resolve(firstChar)
                end
            end
            accumulate(join(charVec),newAcc,newAcc)
        end
            
                
    end

end

"Simply look up `s` in `BetaReader.bigLookup`, in file `CharDict.jl`. If the lookup failes, return the invalid-beta-code sign `#`."
function resolve(s)
    answer = get(bigLookup, s, ("#", "invalid beta-code"))
    answer[1]
end

"Pre-process a string to be transcoded. First, correct the order of accented  capital letters to: asterisk + letter + diacriticals"
function preprocessGreek(s)
    r = r"\*([)(/\\=]+)([a-zA-Z])"
    capsFixed = replace(s, r => s"*\2\1")
    capsFixed
end

"Initialize the iteratore, `accumulate()`; get the final result, which will be using combining diacritics; then normalize to `:NFKC`, using pre-combined diacritics."
function transcodeGreek(s)
    pp = preprocessGreek(s)
    preString = accumulate(pp, "", "")
    Unicode.normalize(preString, :NFKC)
end


