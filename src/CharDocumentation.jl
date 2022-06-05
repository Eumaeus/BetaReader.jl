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