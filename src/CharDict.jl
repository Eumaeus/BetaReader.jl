"This is the main table of correspondances."
bigLookup = Dict([

    # consonants

    ("b" => ("β", "beta"))
    ("g" => ("γ", "gamma"))
    ("d" => ("δ", "delta"))
    ("z" => ("ζ", "zeta"))
    ("q" => ("θ", "theta"))
    ("k" => ("κ", "kappa"))
    ("l" => ("λ", "lambda"))
    ("m" => ("μ", "mu"))
    ("n" => ("ν", "nu"))
    ("c" => ("ξ", "xi"))
    ("p" => ("π", "pi"))
    ("r" => ("ρ", "rho"))
    ("t" => ("τ", "tau"))
    ("f" => ("φ", "phi"))
    ("x" => ("χ", "chi"))
    ("y" => ("ψ", "psi"))

    # terminal sigma handled separately in Main.jl; the user shouldn't have to care

    ("s" => ("σ", "sigma"))

    #vowels

    ("a" => ("α", "alpha"))
    ("e" => ("ε", "epsilon"))
    ("h" => ("η", "eta"))
    ("i" => ("ι", "iota"))
    ("o" => ("ο", "omicron"))
    ("u" => ("υ", "upsilon"))
    ("w" => ("ω", "omega"))

    # diacriticals

    ("(" =>  ("\u0314", "rough breathing"))
    (")" =>  ("\u0313", "smooth breathing"))
    ("\\" => ("\u0300", "grave accent"))
    ("/" =>  ("\u0301", "acute accent"))
    ("=" =>  ("\u0342", "circumflex"))
    ("+" =>  ("\u0308", "diaeresis"))
    ("|" =>  ("\u0345", "iota-subscript"))

    # punctuation

    (" " =>  (" ", "space"))
    ("." =>  (".", "period"))
    ("," =>  (",", "comma"))
    (":" =>  (":", "colon"))
    (";" =>  (";", "Greek question mark"))
    ("-" =>  ("-", "hyphen"))
    ("\n" => ("\n", "carriage-return '\\n'"))
    ("\t" => ("\t", "tab character"))
    ("'" =>  ("\u0027", "apostrophe, mark of elision"))
    ("\"" => ("\"", "quotation mark"))
    ("#" =>  ("\u02b9", "Greek numeral sign")) # greek numeral sign
    #("#" => ("\u0374") # Greek Numeral Sign

    # archaic letters
    ("#1" =>   ("\u03DF", "koppa")) # koppa
    ("#2" =>   ("\u03DB", "stigma")) # stigma
    ("#3" =>   ("\u03D9", "archaic koppa")) # Greek Letter Archaic Koppa
    ("#4" =>   ("\u03DE", "glyph variant of archaic koppa")) # Greek Letter Koppa → glyph variant of Greek Letter Koppa
    ("#5" =>   ("\u03E1", "sampi")) # sampi
    ("#400" => ("\u0371", "heta")) # letter heta

    # critical signs

    ("#6" =>    ("\u2E0F", "paragraphos")) # paragraphos
    ("#8" =>    ("\u2E10", "forked paragraphos")) # forked paragraphos
    ("#9" =>    ("\u0301", "Combining Acute Accent → editorial")) # Combining Acute Accent → editorial
    ("#10" =>   ("\u03FD", "Reversed Lunate Sigma Symbol")) # Greek Capital Reversed Lunate Sigma Symbol
    ("#11" =>   ("\u03FF", "Reversed Dotted Lunate Sigma Symbol")) # Greek Capital Reversed Dotted Lunate Sigma Symbol
    ("#12" =>   ("\u2014", "obelus")) # obelus
    ("#13" =>   ("\u203B", "asteriskos")) # ※ Reference Mark ‣ Asteriskos
    ("#14" =>   ("\u2E16", "diple periestigmene")) # ⸖ Dotted Right Pointing Angle • Diple Periestigmene
    ("#15" =>   ("\u003E", "diple")) # > Greater-Than Sign ‣ Diple
    ("#16" =>   ("\u03FE", "dotted lunate sigma")) # Greek Capital Dotted Lunate Sigma Symbol
    ("#17" =>   ("\u002F", "obelus")) # / Solidus ‣ Obelus
    ("#18" =>   ("\u003C", "reversed diple")) # < Less-Than Sign ‣ Reversed Diple
    ("#19" =>   ("\u0300", "editorial combining grave accent")) # ◌̂ Combining Grave Accent → editorial
    ("#53" =>   ("\u205D", "tricolon")) #  ⁝ tricolon
    ("#150" =>  ("\u221E", "infinity")) # ∞ infinity
    ("#305" =>  ("\u2E0E", "editorial coronis")) # ⸎ Editorial Coronis 
    ("%" =>     ("\u2020", "dagger/crux")) #  † dagger/crux
    ("%13" =>   ("\u2021", "double dagger")) #  ‡ double-dagger
    ("%158" =>  ("\u2042", "asterism")) #  ⁂ asterism
    ("%163" =>  ("\u00B6", "paragraph sign")) # ¶ paragraph sign
    ("?" =>  ("\u0323", "under-dot"))



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