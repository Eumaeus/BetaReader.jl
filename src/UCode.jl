# Functions for identifying classes of characters

"Normalize a unicode Greek input"
function normalizeUCGreek(u)
    Unicode.normalize(u)    
end

"Transliterate a polytonic Greek string, in Unicode, to a Latin transliteration"
function ucToLatin(u)
   normalizeUCGreek(u)
end

function nfkc_to_nfkd(greek_string::AbstractString)
    return join([Unicode.normalize(string(x), :NFKD) for x in Unicode.normalize(greek_string, :NFKC)])
end



"Transliterate a polytonic Greek string, in Unicode, to a beta-code transliteration"
function ucToBeta(u)
    normalU = normalizeUCGreek(u)
    # Decompose into characters
    collectU = collect(nfkc_to_nfkd(normalU))
    return collectU

    # For each Char, NKFC it
    #   for each of those, map to beta
    #   join chars into String
    #   sort beta
    # Join the whole thing.
end

"Return a map of all correspondences. Why do we need this?"
function tlMap(uc::String, bc::String, ltu::String, lta::String) 
    (ucode = uc, bcode = bc, latinUC = ltu, latinAscii = lta)
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

