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

    # For each Char, NKFD it
    #   for each of those, map to beta
    #   join chars into String
    #   sort beta
    # Join the whole thing.
end

function tlMap(uc::String, bc::String, ltu::String, lta::String) 
    (ucode = uc, bcode = bc, latinUC = ltu, latinAscii = lta)
end

function sort_greek_character(betacode::AbstractString)
    # Define the order for sorting diacritical marks
    order = Dict('(' => 0, ')' => 0, '/' => 1, '\\' => 1, '=' => 1, '+' => 2, '|' => 3)
    # Get the diacritical marks in the character and sort them according to the order
    marks = sort([c for c in betacode if c in keys(order)], by=x->order[x])
    # Remove the diacritical marks from the character and add them back in the sorted order
    base = filter(c -> c ∉ keys(order), betacode)
    sorted_str = base * join(marks)
    return sorted_str
end

# filtered_dict = Dict(key => value for (key, value) in md if value[1] == ".")

#= For Latin:
    
    omegas and etas be like ō and ē. Rough breathings get an "h". Keep dieresis.

    Be careful with rho+rough to get them in the right order.

=#

#=
α
β
γ
δ
ε
ζ
η
θ
ι
κ
λ
μ
ν
ξ
ο
π
ρ
ς
σ
ϲ
τ
υ
φ
χ
ψ
ω
ἀ
ἁ
ά
ὰ
ᾶ
ᾁ
ᾀ
ᾴ
ᾲ
ᾷ
ἅ
ἃ
ἇ
ᾅ
ᾃ
ᾇ
ᾄ
ᾂ
ᾆ
ἐ
ἑ
έ
ὲ
ἔ
ἒ
ἕ
ἓ
ἰ
ἱ
ί
ὶ
ῖ
ἴ
ἲ
ἶ
ἵ
ἳ
ἷ
ϊ
ΐ
ῒ
ἠ
ἡ
ή
ὴ
ῆ
ἤ
ἢ
ἦ
ἥ
ἣ
ἧ
ῃ
ᾐ
ᾑ
ῄ
ῂ
ῇ
ᾔ
ᾒ
ᾖ
ᾕ
ᾓ
ᾗ
ὐ
ὑ
ύ
ὺ
ῦ
ϋ
ΰ
ῢ
ῧ
ὕ
ὓ
ὓ
ὗ
ὔ
ὒ
ὖ

=#