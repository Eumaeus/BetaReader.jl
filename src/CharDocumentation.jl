# Functions for documenting coverate and equivalances

"Generate a Markdown table showing all valid consonants" 
function printConsonants()
    header = """##Valid Consonants##\n\n| Greek Character | Beta-Code |\n|-----------------|-----------|"""

    justConsonants = begin
        unSortedConsonants = collect(filter(k -> isConsonant(k.first), bigLookup))
        sort(unSortedConsonants, by = x -> x.second)
    end

    consonantsMD = begin
        map(justConsonants) do p
            grkChar = p.second
            betaChar = p.first
            "| $grkChar | $betaChar |"
        end
    end

    header * "\n" * join(consonantsMD, "\n")

end

"Generate a Markdown table showing all valid vowels"
function printVowels()
    header = """##Valid Vowels##\n\n| Greek Character | Beta-Code |\n|-----------------|-----------|"""

    justVowels = begin
        unSortedVowels = collect(filter(k -> isVowel(k.first), bigLookup))
        sort(unSortedVowels, by = x -> x.second)
    end

    vowelsMD = begin
        map(justVowels) do p
            grkChar = p.second
            betaChar = p.first
            "| $grkChar | $betaChar |"
        end
    end

    header * "\n" * join(vowelsMD, "\n")

end


"Generate a Markdown table showing all valid alphabetic characters" 
function printAlphabetics()
    header = """##Valid Alphabetic Characters##\n\n(medial and terminal sigmas are handled by the library)\n\n| Greek Character | Beta-Code |\n|-----------------|-----------|"""

    justAlphabetics = begin
        unSortedConsonants = collect(filter(k -> isAlphabetic(k.first), bigLookup))
        sort(unSortedConsonants, by = x -> x.second)
    end

    alphabeticsMD = begin
        map(justAlphabetics) do p
            grkChar = p.second
            betaChar = p.first
            "| $grkChar | $betaChar |"
        end
    end

    header * "\n" * join(alphabeticsMD, "\n")

end
