"Transliterate a polytonic Greek string, in Unicode, to a Latin transliteration, using Unicode"
function unicodeToLatinUnicode(g)
   normalU = Unicode.normalize(string(g), :NFKC)
   # Decompose into characters
   collectU = collect(nfkc_to_nfkd(normalU)) |> join
   rawstring = latinucaccumulate(collectU, "", "", false) 
   normalrawstring = Unicode.normalize(string(rawstring), :NFKC)
   returnstring = roughbreathingstolatin(normalrawstring)
   return returnstring
end

"Transliterate a polytonic Greek string, in Beta Code, to a Latin transliteration, using Unicode. This passes on, unchanged, any character that is not a Greek upper- or lower-case letter."
function betacodeToLatinUnicode(g)
   uc = BetaReader.betaToUnicode(g) 
   BetaReader.unicodeToLatinUnicode(uc)
end

"Big recursive function, read each character and transliterate, until done."
function latinucaccumulate(s::String, acc::String, ret::String, upperCaseThisOne::Bool = false)

    # When we're done, an all characters in the original `s` have been treated, `s` will be empty, so we return `ret`. Invalid characters will be transliterated to `#`.
    if (length(s) == 0) return ret

    # Before we're done…
    else
        #println("s == $s")
        charVec = collect(s)
        #println("charVec == $charVec")
        firstChar = popfirst!(charVec)
        #println("charVec == $charVec")
        #println("firstChar == $firstChar")
        resolvedFC = begin
           if (isuppercase(firstChar)) 
              lcresolved = latinucresolve(lowercase(firstChar))
              cs = collect(lcresolved)
              fc = popfirst!(cs)
              ucfc = uppercase(fc)
              join(vcat(ucfc, cs))
           else
               latinucresolve(firstChar)  
           end
        end

        # Iterate
        newAcc = acc * resolvedFC
        #println("""newAcc == $newAcc""")
        latinucaccumulate(join(charVec),newAcc,newAcc) 
    end

end



"Simply look up `s` in `BetaReader.bigLatinUCLookup`, in file `UnicodeCharDict.jl`. If the lookup fails, return the invalid-beta-code sign `#`."
function latinucresolve(c::Char)
    answer = get(bigLatinUCLookup, string(c), (string(c), "unchanged"))
    answer[1]
end

"Sort out the 'h' character that replaces rough-breathings."
function roughbreathingstolatin(s)
    diphRegex = r"([aēeoōuAĒEOŌU])([ui])h"
    diphsFixed = replace(s, diphRegex => s"\1h\2")
    pairsRegex = r"([aeēiouō])h"
    pairsFixed = replace(diphsFixed, pairsRegex => s"h\1")
    capsRegex = r"([AEĒIOUŌ])h"

    # Function to replace and change case
    function caseChange(match)
        # Extract the matched group and convert to uppercase
        return "H" * lowercase(replace(match, "h" => ""))
    end

    capsFixed = replace(string(pairsFixed), capsRegex => caseChange)
    return capsFixed
end

"We want yet another character-dictionary for this. It is tempting to use the Betacode and/or Unicode ones, but there would be so many exceptions, we might as well define a new table."
bigLatinUCLookup = Dict([
    ("β" => ("b", "beta"))
    ("γ" => ("g", "gamma"))
    ("δ" => ("d", "delta"))
    ("ϝ" => ("v", "digamma"))
    ("ζ" => ("z", "zeta"))
    ("θ" => ("th", "theta"))
    ("κ" => ("k", "kappa"))
    ("λ" => ("l", "lambda"))
    ("μ" => ("m", "mu"))
    ("ν" => ("n", "nu"))
    ("ξ" => ("x", "xi"))
    ("π" => ("p", "pi"))
    ("ρ" => ("r", "rho"))
    ("τ" => ("t", "tau"))
    ("φ" => ("ph", "phi"))
    ("χ" => ("ch", "chi"))
    ("ψ" => ("ps", "psi"))

    # sigmas
    ("σ" => ("s", "sigma"))
    ("ς" => ("s", "sigma"))
    ("ϲ" => ("s", "sigma"))

    # vowels

    ("α" => ("a", "alpha"))
    ("ε" => ("e", "epsilon"))
    ("η" => ("ē", "eta"))
    ("ι" => ("i", "iota"))
    ("ο" => ("o", "omicron"))
    ("υ" => ("u", "upsilon"))
    ("ω" => ("ō", "omega"))

    # diacriticals

    ("\u0314" =>  ("h", "rough breathing"))
    ("\u0313" =>  ("", "smooth breathing"))
    ("\u0300" => ("", "grave accent"))
    ("\u0301" =>  ("", "acute accent, oxia"))
    ("\u0344" =>  ("", "acute accent, tonos"))
    ("\u0342" =>  ("", "circumflex"))
    ("\u0308" =>  ("\u0308", "diaeresis"))
    ("\u0345" =>  ("i", "iota-subscript"))

    # punctuation

    (" " =>  (" ", "space"))
    ("." =>  (".", "period"))
    ("," =>  (",", "comma"))
    ("᾽" =>  ("’", "apostrophe"))
    ("’" => ("’", "apostrophe"))
    ("\n" => ("\n", "carriage-return '\\n'"))
    ("\t" => ("\t", "tab character"))
    ("\"" => ("\"", "quotation mark"))
    ("\u00b7" =>  (":", "colon"))
    (";" =>  ("?", "Greek question mark"))


])