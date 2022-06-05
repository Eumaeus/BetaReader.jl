

@testset "BasicTests" begin

 #=
 @test 1 == 1

 @test_broken 3 == 4

 @test "abc" == "def"

 @test_broken "abc" == "abc"

 @test BetaReader.greetMe() == "Hello, Boss!"
 =#

 # Read tests

 @test BetaReader.isBreathing("(")
 @test BetaReader.isBreathing(")")
 @test BetaReader.isBreathing("a") == false
@test BetaReader.isAccent("/")
@test BetaReader.isAccent("\\")
@test BetaReader.isAccent("=")
@test BetaReader.isAccent("(") == false
@test BetaReader.isAccent("") == false

@test BetaReader.isNumber("2")
@test BetaReader.isNumber("0")
@test BetaReader.isNumber("a") == false
@test BetaReader.isNumber(":") == false
@test BetaReader.isNumber("") == false


@test BetaReader.isAlphabetic("a")
@test BetaReader.isAlphabetic("A")
@test BetaReader.isAlphabetic("x")
@test BetaReader.isAlphabetic("S")
@test BetaReader.isAlphabetic(":") == false
@test BetaReader.isAlphabetic("2") == false
@test BetaReader.isAlphabetic("j") == false
@test BetaReader.isAlphabetic(":") == false
@test BetaReader.isAlphabetic("") == false

@test BetaReader.isDiacritical("=")

@test BetaReader.isConsonant("s")
@test BetaReader.isConsonant("b")
@test BetaReader.isConsonant("c")
@test BetaReader.isConsonant("t")
@test BetaReader.isConsonant("x")

@test BetaReader.isIotaSubscript("|")
@test BetaReader.isDiaeresis("+")

@test BetaReader.isDiphthong("ai")
@test BetaReader.isDiphthong("ei")
@test BetaReader.isDiphthong("ou")
@test BetaReader.isDiphthong("hi") == false
@test BetaReader.isDiphthong("io") == false
@test BetaReader.isDiphthong("Ai")
@test BetaReader.isDiphthong("Ei")
@test BetaReader.isDiphthong("Ou")
@test BetaReader.isDiphthong("Hi") == false
@test BetaReader.isDiphthong("Io") == false

@test BetaReader.isSigmaTerminator(" ")

@test BetaReader.isUC("A")
@test BetaReader.isUC("B")
@test BetaReader.isUC("G")
@test BetaReader.isUC("D")
@test BetaReader.isUC("E")
@test BetaReader.isUC("Z")
@test BetaReader.isUC("H")
@test BetaReader.isUC("Q")
@test BetaReader.isUC("I")

@test BetaReader.isUC("a") == false
@test BetaReader.isUC("b") == false
@test BetaReader.isUC("c") == false
@test BetaReader.isUC("=") == false
@test BetaReader.isUC(".") == false


@test get(BetaReader.bigLookup,"b","#") == "β"
@test get(BetaReader.bigLookup,"g","#") == "γ"
@test get(BetaReader.bigLookup,"&","#") == "#"

@test BetaReader.transcodeGreek("mh=nin") == "μῆνιν"
@test BetaReader.transcodeGreek("Mh=nin") == "Μῆνιν"
@test BetaReader.transcodeGreek("a)/eide") == "ἄειδε"
@test BetaReader.transcodeGreek("qea/") == "θεά"
@test BetaReader.transcodeGreek("Phlhi+a/dew") == "Πηληϊάδεω"
@test BetaReader.transcodeGreek("A)xilh=os") == "Ἀχιλῆος"
@test BetaReader.transcodeGreek("*phlhi+a/dew") == "Πηληϊάδεω"
@test BetaReader.transcodeGreek("*a)xilh=os") == "Ἀχιλῆος"


@test BetaReader.transcodeGreek("*a)xilh=os\nou)lome/nhn") == "Ἀχιλῆος\nοὐλομένην"
@test BetaReader.transcodeGreek("ou)lome/nhn, h(\\ muri/'") == "οὐλομένην, ἣ μυρί\u0039"
@test BetaReader.transcodeGreek("a)/lge' e)/qhke,") == "ἄλγε\u0039 ἔθηκε,"
@test BetaReader.transcodeGreek("di=os A)xilleu/s.") == "δῖος Ἀχιλλεύς."
@test BetaReader.transcodeGreek("cune/hke ma/xesqai;") == "ξυνέηκε μάχεσθαι;"
@test BetaReader.transcodeGreek("ma/xesqai") == "μάχεσθαι"
@test BetaReader.transcodeGreek(""""di=os" A)xilleu/s.""") == """"δῖος" Ἀχιλλεύς."""
@test BetaReader.transcodeGreek("di=o?s A)xilleu/s.") == "δῖο\u0323ς Ἀχιλλεύς."

# Test upper-casing
@test BetaReader.transcodeGreek("*sigma") == "Σιγμα"
@test BetaReader.transcodeGreek("Sigma") == "Σιγμα"


# Test export
@test transcodeGreek("di=o?s A)xilleu/s.") == "δῖο\u0323ς Ἀχιλλεύς."

# Test the esoteric "#…" codes

@test transcodeGreek("d# e# a#") == "δ\u02B9 ε\u02B9 α\u02B9" # numeric marker
@test transcodeGreek("a #1 b") == "α \u03DF β" # lc koppa
@test transcodeGreek("a *#1 b") == "α \u03DE β" # uc koppa
@test transcodeGreek("a #11 b") == "α \u03FF β" # Greek Capital Reversed Dotted Lunate Sigma Symbol
@test transcodeGreek("#12 b") == "\u2014 β" # EM Dash ‣ Obelus
@test transcodeGreek("*#12 b") == "\u2014 β" # Obelus can't be uppercased, so just deal with it…
@test transcodeGreek("*#2 b") == "\u03DA β" # uc stigma
@test transcodeGreek("#2 b") == "\u03DB β" # lc stigma 
@test transcodeGreek("*#3 b") == "\u03D8 β" # uc archaic koppa
@test transcodeGreek("#3 b") == "\u03D9 β" # lc archaic koppa
@test transcodeGreek("#4 b") == "\u03DE β" #  Greek Letter Koppa → glyph variant of Greek Letter Koppa
@test transcodeGreek("*#5 b") == "\u03E0 β" # uc sampi
@test transcodeGreek("#5 b") == "\u03E1 β" # lc sampi
@test transcodeGreek("#6 b") == "\u2E0F β" # paragraphos
@test transcodeGreek("#8 b") == "\u2E10 β" # Forked Paragraphos
@test transcodeGreek("#9 b") == "\u0301 β" # Combining Acute Accent → editorial
@test transcodeGreek("#10 b") == "\u03FD β" # Greek Capital Reversed Lunate Sigma Symbol

@test transcodeGreek("#13 b") == "\u203B β" # ※ Reference Mark ‣ Asteriskos
@test transcodeGreek("#14 b") == "\u2E16 β" # ⸖ Dotted Right Pointing Angle • Diple Periestigmene
@test transcodeGreek("#15 b") == "\u003E β" # > Greater-Than Sign ‣ Diple
@test transcodeGreek("#16 b") == "\u03FE β" # Greek Capital Dotted Lunate Sigma Symbol
@test transcodeGreek("#17 b") == "\u002F β" # / Solidus ‣ Obelus
@test transcodeGreek("#18 b") == "\u003C β" # < Less-Than Sign ‣ Reversed Diple
@test transcodeGreek("#19 b") == "\u0300 β" # ◌̂ Combining Grave Accent → editorial
@test transcodeGreek("#53 b") == "\u205D β" #  ⁝ tricolon

@test BetaReader.isEditorial("\u203B")
@test BetaReader.isEditorial("\u002F")
@test BetaReader.isEditorial("a") == false
@test BetaReader.isEditorial(":") == false








end

