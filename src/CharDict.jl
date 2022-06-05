"This is the main table of correspondances."
bigLookup = Dict([

    # consonants

    ("b" => "β")
    ("g" => "γ")
    ("d" => "δ")
    ("z" => "ζ")
    ("q" =>  "θ")
    ("k" => "κ")
    ("l" => "λ")
    ("m" => "μ")
    ("n" => "ν")
    ("c" => "ξ")
    ("p" => "π")
    ("r" => "ρ")
    ("t" => "τ")
    ("f" => "φ")
    ("x" => "χ")
    ("y" => "ψ")

    # terminal sigma handled separately in Main.jl; the user shouldn't have to care

    ("s" => "σ")

    #vowels

    ("a" => "α")
    ("e" => "ε")
    ("h" => "η")
    ("i" => "ι")
    ("o" => "ο")
    ("u" => "υ")
    ("w" => "ω")

    # diacriticals

    ("(" => "\u0314")
    (")" =>  "\u0313")
    ("\\" => "\u0300")
    ("/" => "\u0301")
    ("=" => "\u0342")
    ("+" => "\u0308")
    ("|" => "\u0345")

    # punctuation

    (" " => " ")
    ("." => ".")
    ("\n" => "\n")
    ("\t" => "\t")
    ("," => ",")
    (":" => ":")
    (";" => ";")
    ("'" => "\u0039")
    ("?" => "\u0323")
    ("\"" => "\"")
    ("-" => "-")
    #("#" => "\u0374") # Greek Numeral Sign
    ("#" => "\u02b9") # greek numeral sign

    # archaic letters
    ("#1" => "\u03DF") # koppa
    ("#2" => "\u03DB") # stigma
    ("#3" => "\u03D9") # Greek Letter Archaic Koppa
    ("#4" => "\u03DE") # Greek Letter Koppa → glyph variant of Greek Letter Koppa
    ("#5" => "\u03E1") # sampi

    # critical signs

    ("#6" => "\u2E0F") # paragraphos
    ("#8" => "\u2E10") # forked paragraphos
    ("#9" => "\u0301") # Combining Acute Accent → editorial
    ("#10" => "\u03FD") # Greek Capital Reversed Lunate Sigma Symbol
    ("#11" => "\u03FF") # Greek Capital Reversed Dotted Lunate Sigma Symbol
    ("#12" => "\u2014") # obelus
    ("#13" => "\u203B") # ※ Reference Mark ‣ Asteriskos
    ("#14" => "\u2E16") # ⸖ Dotted Right Pointing Angle • Diple Periestigmene
    ("#15" => "\u003E") # > Greater-Than Sign ‣ Diple
    ("#16" => "\u03FE") # Greek Capital Dotted Lunate Sigma Symbol
    ("#17" => "\u002F") # / Solidus ‣ Obelus
    ("#18" => "\u003C") # < Less-Than Sign ‣ Reversed Diple
    ("#19" => "\u0300") # ◌̂ Combining Grave Accent → editorial
    ("#53" => "\u205D") #  ⁝ tricolon



])


#=
"Μῆνιν ἄειδε, θεά, Πηληϊάδεω Ἀχιλῆος,"

rough breathing \u0314
smooth breathing \u0313
grave \u0300
acute \u0301
circumflex \u0342
diaeresis \u0308
iota-subscr \u0345

=#