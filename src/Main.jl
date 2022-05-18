greet() = print("Hello World!")

greetMe() = "Hello, Boss."

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

function isPunctuation(c)
    puncts = """,."';[]-—:"""
    if (contains(puncts,c)) true
    else false
    end
end


function isValidLCConsonant(c)
    validLCConsonants = "bgdzqklmncprstfxy"
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
    validLCConsonants = "BGDZQKLMNCPRSTFXY"
    if (contains(validUCConsonants,c)) true
    else false
    end
end

function isValidLCVowel(c)
    validLCVowels = "aehiouw"
    if (contains(validLCVowels, c)) true
    else false
    end
end

function isValidUCVowel(c)
    validUCVowels = "AEHIOUW"
    if (contains(validLCVowels, c)) true
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
