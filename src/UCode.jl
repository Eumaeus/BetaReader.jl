# Functions for identifying classes of characters

"Normalize a unicode Greek input"
function normalizeUCGreek(u)
    Unicode.normalize(u)    
end

function nfkc_to_nfkd(greek_string::AbstractString)
    return join([Unicode.normalize(string(x), :NFKD) for x in Unicode.normalize(greek_string, :NFKC)])
end

"Transliterate a polytonic Greek string, in Unicode, to a beta-code transliteration"
function unicodeToBeta(u)
    normalU = normalizeUCGreek(u)
    # Decompose into characters
    collectU = collect(nfkc_to_nfkd(normalU)) |> join
    ucaccumulate(collectU, "", "", false)

    # For each Char, NKFC it
    #   for each of those, map to beta
    #   join chars into String
    #   sort beta
    # Join the whole thing.
end


function sort_greek_character(betacode::AbstractString)
    # Define the order for sorting diacritical marks
    order = Dict('(' => 0, ')' => 0, '/' => 1, '\\' => 1, '=' => 1, '+' => 0, '|' => 2)
    # Get the diacritical marks in the character and sort them according to the order
    marks = sort([c for c in betacode if c in keys(order)], by=x->order[x])
    # Remove the diacritical marks from the character and add them back in the sorted order
    base = filter(c -> c ∉ keys(order), betacode)
    sorted_str = base * join(marks)
    return sorted_str
end

"Big recursive function, read each character and transliterate, until done."
function ucaccumulate(s::String, acc::String, ret::String, upperCaseThisOne::Bool = false)

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
            # Let's be grown-ups and skip the *-capitals
            if (isuppercase(firstChar)) 
               temp1 = uppercase(ucresolve(lowercase(firstChar)))
               if (length(temp1) > 1) 
                  "*" * temp1
              else
                temp1
              end
            else
               ucresolve(firstChar)  
            end

        end
        # Iterate
        newAcc = acc * resolvedFC
        #println("""newAcc == $newAcc""")
        ucaccumulate(join(charVec),newAcc,newAcc) 
    end

end

"Simply look up `s` in `BetaReader.bigUCLookup`, in file `UnicodeCharDict.jl`. If the lookup fails, return the invalid-beta-code sign `#`."
function ucresolve(c::Char)
    answer = get(bigUCLookup, string(c), ("#", "invalid beta-code"))
    answer[1]
end

