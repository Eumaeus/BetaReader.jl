"This is the main table of correspondances."
bigUCLookup = Dict([

    # consonants

    ("β" => ("b", "beta"))
    ("γ" => ("g", "gamma"))
    ("δ" => ("d", "delta"))
    ("ϝ" => ("v", "digamma"))
    ("ζ" => ("z", "zeta"))
    ("θ" => ("q", "theta"))
    ("κ" => ("k", "kappa"))
    ("λ" => ("l", "lambda"))
    ("μ" => ("m", "mu"))
    ("ν" => ("n", "nu"))
    ("ξ" => ("c", "xi"))
    ("π" => ("p", "pi"))
    ("ρ" => ("r", "rho"))
    ("τ" => ("t", "tau"))
    ("φ" => ("f", "phi"))
    ("χ" => ("x", "chi"))
    ("ψ" => ("y", "psi"))

    # terminal sigma handled separately in Main.jl; the user shouldn't have to care

    ("σ" => ("s", "sigma"))

    #vowels

    ("α" => ("a", "alpha"))
    ("ε" => ("e", "epsilon"))
    ("η" => ("h", "eta"))
    ("ι" => ("i", "iota"))
    ("ο" => ("o", "omicron"))
    ("υ" => ("u", "upsilon"))
    ("ω" => ("w", "omega"))

    # diacriticals

    ("\u0314" =>  ("(", "rough breathing"))
    ("\u0313" =>  (")", "smooth breathing"))
    ("\u0300" => ("\\", "grave accent"))
    ("\u0301" =>  ("/", "acute accent"))
    ("\u0342" =>  ("=", "circumflex"))
    ("\u0308" =>  ("+", "diaeresis"))
    ("\u0345" =>  ("|", "iota-subscript"))

    # punctuation

    (" " =>  (" ", "space"))
    ("." =>  (".", "period"))
    ("," =>  (",", "comma"))
    ("\u00b7" =>  (":", "colon"))
    (";" =>  (";", "Greek question mark"))
    ("-" =>  ("-", "hyphen"))
    ("–" =>  ("–", "en-dash"))
    ("—" =>  ("—", "em-dash"))
    ("\n" => ("\n", "carriage-return '\\n'"))
    ("\t" => ("\t", "tab character"))
    ("’" =>  ("'", "apostrophe, mark of elision"))
    ("\"" => ("\"", "quotation mark"))
    ("\u02b9" =>  ("#", "Greek numeral sign")) # greek numeral sign

    # archaic letters
    ("\u03DF" =>   ("#1", "koppa")) # koppa
    ("\u03DB" =>   ("#2", "stigma")) # stigma
    ("\u03D9" =>   ("#3", "archaic koppa")) # Greek Letter Archaic Koppa
    ("\u03DE" =>   ("#4", "glyph variant of archaic koppa")) # Greek Letter Koppa → glyph variant of Greek Letter Koppa
    ("\u03E1" =>   ("#5", "sampi")) # sampi
    ("\u0371" => ("#400", "heta")) # letter heta
    ("\u03FB" => ("#711", "san")) # letter san

    # critical signs

    ("\u2E0F" => ("#6", "paragraphos")) # paragraphos
    ("\u2E10" => ("#8", "forked paragraphos")) # forked paragraphos
    ("\u0301" => ("#9", "Combining Acute Accent → editorial")) # Combining Acute Accent → editorial
    ("\u03FD" => ("#10", "Reversed Lunate Sigma Symbol")) # Greek Capital Reversed Lunate Sigma Symbol
    ("\u03FF" => ("#11", "Reversed Dotted Lunate Sigma Symbol")) # Greek Capital Reversed Dotted Lunate Sigma Symbol
    ("\u2014" => ("#12", "obelus; em-dash")) # obelus
    ("\u203B" => ("#13", "asteriskos")) # ※ Reference Mark ‣ Asteriskos
    ("\u2E16" => ("#14", "diple periestigmene")) # ⸖ Dotted Right Pointing Angle • Diple Periestigmene
    ("\u003E" => ("#15", "diple")) # > Greater-Than Sign ‣ Diple
    ("\u03FE" => ("#16", "dotted lunate sigma")) # Greek Capital Dotted Lunate Sigma Symbol
    ("\u002F" => ("#17", "solidus")) # / Solidus ‣ Obelus
    ("\u003C" => ("#18", "reversed diple")) # < Less-Than Sign ‣ Reversed Diple
    ("\u0300" => ("#19", "editorial combining grave accent")) # ◌̂ Combining Grave Accent → editorial

    ("\u0375" => ("#22", "Greek Lower Numeral Sign")) #  Greek Lower Numeral Sign
    ("⁝" => ("#74", "tricolon")) 

    ("\u205D" => ("#53", "tricolon")) #  ⁝ tricolon
    ("\u221E" => ("#150", "infinity")) # ∞ infinity
    ("\u2E0E" => ("#310", "editorial coronis")) # ⸎ Editorial Coronis 
    ("\u2627" => ("#465", "chi rho")) # ☧ chi-rho
    ("\u2020" => ("%", "dagger/crux")) #  † dagger/crux
    ("?" => ("%1", "Latin question mark")) 
    ("\u007c" => ("%5", "long vertical bar")) # | 
    ("\u2016" => ("%17", "double vertical line")) # ‖
    ("\u23d1" => ("%40", "metrical breve")) # ⏑

    ("\u23d1" => ("%40", "metrical breve")) # ⏑
    ("\u2013" => ("%41", "metrical macron")) # — 
    ("\u23D5" => ("%42", "two shorts over one long")) # ⏕
    ("\u00D7" => ("%43", "metrical anceps")) # × 
    ("\u23D2" => ("%44", "metrical long over short")) # ⏒ 
    ("\u23D3" => ("%45", "metrical short over long")) # ⏓
    ("\u23D4" => ("%46", "metrical long over two shorts")) # ⏔
    ("\u23D6" => ("%141", "metrical two shorts joined")) # ⏖

    ("\u2021" => ("%13", "double dagger")) #  ‡ double-dagger
    ("\u2042" => ("%158", "asterism")) #  ⁂ asterism
    ("\u00B6" => ("%163", "paragraph sign")) # ¶ paragraph sign
    ("\u0323" => ("?", "under-dot"))

    # Parentheses

    ("[" => ("[", "left square bracket"))
    ("]" => ("]", "right square bracket"))
    ("(" => ("[1", "left parenthesis"))
    (")" => ("]1", "right parenthesis"))
    ("\u3008" => ("[2", "left-pointing angle bracket"))
    ("\u3009" => ("]2", "right-pointing angle bracket"))
    ("{" => ("[3", "left curly bracket"))
    ("}" => ("]3", "right curly bracket"))
    ("{" => ("{", "left curly bracket"))
    ("}" => ("}", "right curly bracket"))
    ("\u27E6" => ("[4", "left white square bracket"))
    ("\u27E7" => ("]4", "right white square bracket"))

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