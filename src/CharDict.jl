bigLookup = Dict([
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
    # terminal sigma handled separately in Main.jl
    ("s" => "ς")
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