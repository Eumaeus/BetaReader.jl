# Functions for identifying classes of characters

function isBreathing(c)
    breathings = "()"
    if (contains(breathings, c))
        true
    else
        false
    end
end

function isAccent(c)
    accents = "/\\="
    if (contains(accents, c))
        true
    else
        false
    end
end

function isIotaSubscript(c)
    if (c == "|") true
    else false
    end
end

function isDiaeresis(c)
    if (c == "+") true
    else false
    end
end

function isDiacritical(c)
    if isAccent(c) true
    elseif isBreathing(c) true
    elseif isDiaeresis(c) true
    elseif isIotaSubscript(c) true
    else false
    end
end


function isPunctuation(c)
    puncts = """,."';[]-—: """
    if (contains(puncts,c)) true
    else false
    end
end


function isValidLCConsonant(c)
    validLCConsonants = "bgdzqklmncpstfxy"
    if (contains(validLCConsonants,c)) true
    else false
    end
end

function isSigmaTerminator(c)
    sigmaTerms = """,.":;— \t\n"""
    if (contains(sigmaTerms, c   )) true
    else false
    end
end


function isValidUCConsonant(c)
    validUCConsonants = "BGDZQKLMNCPSTFXY"
    if (contains(validUCConsonants,c)) true
    else false
    end
end

function isConsonant(c)
    if (isValidUCConsonant(c)) true
    elseif (isValidLCConsonant(c)) true
    else false
    end
end


# Rho counts as a vowel here, because we're only interested in diacritical marks
function isValidLCVowel(c)
    validLCVowels = "aehiouwr"
    if (contains(validLCVowels, c)) true
    else false
    end
end

function isValidUCVowel(c)
    validUCVowels = "AEHIOUWR"
    if (contains(validUCVowels, c)) true
    else false
    end
end

function isUC(c)
    if (isValidUCConsonant(c)) true
    elseif (isValidUCVowel(c)) true
    else false
    end
end


function isVowel(c)
    if isValidUCVowel(c) true
    elseif isValidLCVowel(c) true
    else false
    end
end

function isUCMarker(c)
    if c == "*" true
    else false
    end
end

function isDiphthong(s)
    allDiphthongs = ["ai", "ei", "oi", "ui", "au", "eu", "hu", "ou", "Ai", "Ei", "Oi", "Ui", "Au", "Eu", "Hu", "Ou"]
    if (s in(allDiphthongs)) true
    else false
    end
end

function accumulate(s::String, acc::String, ret::String)

    if (length(s) == 0) return ret
    else
        charVec = split(s, "")
        firstChar = popfirst!(charVec)
        secondChar = begin 
            if (length(charVec) < 1) ""
            else charVec[1]
            end
        end

        if (firstChar == "s")
            if (isSigmaTerminator(secondChar))
                newAcc = acc * "ς"
                accumulate(join(charVec),newAcc,newAcc)
            else
                newAcc = acc * resolve(firstChar)
                accumulate(join(charVec),newAcc,newAcc)
            end
        elseif (isUCMarker(firstChar)) 
            if (length(charVec) < 1)
                newAcc = acc * "#"
                accumulate(join(charVec),newAcc,newAcc) 
            else
                trashAsterix = popfirst!(charVec)
                resolvedLC = resolve(lowercase(secondChar))
                println(resolvedLC)
                resolvedUC = uppercase(resolvedLC)
                newAcc = acc * resolvedUC
                accumulate(join(charVec),newAcc,newAcc)
            end
        elseif (isUC(firstChar))
            resolvedLC = resolve(lowercase(firstChar))
            resolvedUC = uppercase(resolvedLC)
            newAcc = acc * resolvedUC
            accumulate(join(charVec),newAcc,newAcc) 
        else
            newAcc = acc * resolve(firstChar)
            accumulate(join(charVec),newAcc,newAcc)
        end
            
                
    end

end


function resolve(s)
    get(bigLookup, s, "#")
end

function transcode(s)
    preString = accumulate(s, "", "")
    Unicode.normalize(preString, :NFKC)
end




#=

Send string in with empty "result" and empty "accum"


"accumulate" function: is the string-param empty?
        return "result"

otherwise pop the first character

is it a vowel?
    look at the next character
    is it a letter or punctuation?
        translate the vowel, add it to "result" and iterate with empty "accum"
    is it a diacritical? 
        add vowel to "accum" and iterate, keeping "result"
is it a diacritical?
    look at the next character
    is it another diacritical?
        add diacritical to "accum" and iterate, keeping "result"
    is it an alphabetic or punctuation?
        translate "accum" + popped char,
            add to "result" and iterate with empty "accum"
is it a punctuation?
    translate, if necessary, add to "result" and iterate with empty "accum"
is it a consonant?
    is it an "s"?
        look at the next character, translate appropriately, add to "result" and iterate with empty "accum"
    if not an "s", 
        translate, add to "result" and iterate with empty "accum"


is it not a vowel?



=#