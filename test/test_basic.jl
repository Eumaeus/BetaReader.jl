

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
@test BetaReader.isConsonant("") == false


@test BetaReader.isIotaSubscript("|")
@test BetaReader.isDiaeresis("+")
@test BetaReader.isIotaSubscript("") == false
@test BetaReader.isDiaeresis("") == false

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
@test BetaReader.isDiphthong("") == false

@test BetaReader.isSigmaTerminator(" ")
@test BetaReader.isSigmaTerminator(",")
@test BetaReader.isSigmaTerminator(":")
@test BetaReader.isSigmaTerminator("")

@test BetaReader.isUC("A")
@test BetaReader.isUC("B")
@test BetaReader.isUC("G")
@test BetaReader.isUC("D")
@test BetaReader.isUC("E")
@test BetaReader.isUC("Z")
@test BetaReader.isUC("H")
@test BetaReader.isUC("Q")
@test BetaReader.isUC("I")
@test BetaReader.isUC("") == false

@test BetaReader.isUC("a") == false
@test BetaReader.isUC("b") == false
@test BetaReader.isUC("c") == false
@test BetaReader.isUC("=") == false
@test BetaReader.isUC(".") == false


@test get(BetaReader.bigLookup,"b","#")[1] == "β"
@test get(BetaReader.bigLookup,"g","#")[1] == "γ"
@test get(BetaReader.bigLookup,"&","#") == "#"
@test get(BetaReader.bigLookup,"","#") == "#"

@test BetaReader.transcodeGreek("mh=nin") == "μῆνιν"
@test BetaReader.transcodeGreek("Mh=nin") == "Μῆνιν"
@test BetaReader.transcodeGreek("a)/eide") == "ἄειδε"
@test BetaReader.transcodeGreek("qea/") == "θεά"
@test BetaReader.transcodeGreek("Phlhi+a/dew") == "Πηληϊάδεω"
@test BetaReader.transcodeGreek("A)xilh=os") == "Ἀχιλῆος"
@test BetaReader.transcodeGreek("*phlhi+a/dew") == "Πηληϊάδεω"
@test BetaReader.transcodeGreek("*a)xilh=os") == "Ἀχιλῆος"
@test BetaReader.transcodeGreek("") == ""
@test BetaReader.transcodeGreek("mh=nin a)/eide qea/, *phlhi+a/dew *a)xilh=os") == "μῆνιν ἄειδε θεά, Πηληϊάδεω Ἀχιλῆος"


@test BetaReader.transcodeGreek("*a)xilh=os\nou)lome/nhn") == "Ἀχιλῆος\nοὐλομένην"
@test BetaReader.transcodeGreek("ou)lome/nhn, h(\\ muri/'") == "οὐλομένην, ἣ μυρί\u0027"
@test BetaReader.transcodeGreek("a)/lge' e)/qhke,") == "ἄλγε\u0027 ἔθηκε,"
@test BetaReader.transcodeGreek("di=os A)xilleu/s.") == "δῖος Ἀχιλλεύς."
@test BetaReader.transcodeGreek("cune/hke ma/xesqai;") == "ξυνέηκε μάχεσθαι;"
@test BetaReader.transcodeGreek("ma/xesqai") == "μάχεσθαι"
@test BetaReader.transcodeGreek(""""di=os" A)xilleu/s.""") == """"δῖος" Ἀχιλλεύς."""
@test BetaReader.transcodeGreek(""""di=os" *a)xilleu/s.""") == """"δῖος" Ἀχιλλεύς."""

@test BetaReader.transcodeGreek("di=o?s A)xilleu/s.") == "δῖο\u0323ς Ἀχιλλεύς."

# Test upper-casing
@test BetaReader.transcodeGreek("*sigma") == "Σιγμα"
@test BetaReader.transcodeGreek("Sigma") == "Σιγμα"

# Test checking for punctuation
@test BetaReader.isPunctuation(".")
@test BetaReader.isPunctuation(",")
@test BetaReader.isPunctuation(":")
@test BetaReader.isPunctuation("#")
@test BetaReader.isPunctuation("a") == false
@test BetaReader.isPunctuation("") == false


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
@test transcodeGreek("#150 b") == "\u221E β" # infinity

@test transcodeGreek("#400 b") == "\u0371 β" # archaic letter heta (lc)
@test transcodeGreek("*#400 b") == "\u0370 β" # archaic letter heta (uc)



@test transcodeGreek("% b") == "\u2020 β" #  † dagger/crux
@test transcodeGreek("%13 b") == "\u2021 β" #  ‡ double-dagger
@test transcodeGreek("%158 b") == "\u2042 β" #  ⁂ asterism
@test transcodeGreek("%163 b") == "\u00B6 β" # ¶ paragraph sign


# Test checking for archaic forms

@test BetaReader.isArchaic("#1")
@test BetaReader.isArchaic("#2")
@test BetaReader.isArchaic("#3")
@test BetaReader.isArchaic("#4")
@test BetaReader.isArchaic("#5")
@test BetaReader.isArchaic("#400")
@test BetaReader.isArchaic("") == false
@test BetaReader.isArchaic("#9") == false
@test BetaReader.isArchaic("#11") == false
@test BetaReader.isArchaic("#12") == false

# Test checking for editorial/critical signs

@test BetaReader.isEditorial("#13")
@test BetaReader.isEditorial("#14")
@test BetaReader.isEditorial("#15")
@test BetaReader.isEditorial("#16")
@test BetaReader.isEditorial("#17")
@test BetaReader.isEditorial("#18")
@test BetaReader.isEditorial("#19")
@test BetaReader.isEditorial("#53")
@test BetaReader.isEditorial("#53")
@test BetaReader.isEditorial("#11")
@test BetaReader.isEditorial("#305")
@test BetaReader.isEditorial("?")
@test BetaReader.isEditorial("a") == false
@test BetaReader.isEditorial(":") == false
@test BetaReader.isEditorial("") == false
@test BetaReader.isEditorial("#") == false
@test BetaReader.isEditorial("*") == false

# Test incomplete and wrong strings

@test BetaReader.transcodeGreek("#45") == "#"
@test BetaReader.transcodeGreek("v") == "#"
@test BetaReader.transcodeGreek("@") == "#"


# Truth test

iliad = """mh=nin a)/eide qea\\ *phlhi+a/dew *a)xilh=os\n\n
ou)lome/nhn, h(\\ muri/' *a)xaioi=s a)/lge' e)/qhke,\n\n
polla\\s d' i)fqi/mous yuxa\\s *a)/i+di proi+/ayen\n\n
h(rw/wn, au)tou\\s de\\ e(lw/ria teu=xe ku/nessin\n\n
5oi)wnoi=si/ te pa=si, *dio\\s d' e)telei/eto boulh/,\n\n
e)c ou(= dh\\ ta\\ prw=ta diasth/thn e)ri/sante\n\n
*a)trei+/dhs te a)/nac a)ndrw=n kai\\ di=os *a)xilleu/s."""

iliadBadBeta = """mh=nin a)/eide qea\\ *phlhi+a/dew *)axilh=os\n\n
ou)lome/nhn, h(\\ muri/' *)axaioi=s a)/lge' e)/qhke,\n\n
polla\\s d' i)fqi/mous yuxa\\s *)/ai+di proi+/ayen\n\n
h(rw/wn, au)tou\\s de\\ e(lw/ria teu=xe ku/nessin\n\n
5oi)wnoi=si/ te pa=si, *dio\\s d' e)telei/eto boulh/,\n\n
e)c ou(= dh\\ ta\\ prw=ta diasth/thn e)ri/sante\n\n
*)atrei+/dhs te a)/nac a)ndrw=n kai\\ di=os *)axilleu/s."""


@test transcodeGreek(iliad) == "μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος\n\n\nοὐλομένην, ἣ μυρί' Ἀχαιοῖς ἄλγε' ἔθηκε,\n\n\nπολλὰς δ' ἰφθίμους ψυχὰς Ἄϊδι προΐαψεν\n\n\nἡρώων, αὐτοὺς δὲ ἑλώρια τεῦχε κύνεσσιν\n\n\n#οἰωνοῖσί τε πᾶσι, Διὸς δ' ἐτελείετο βουλή,\n\n\nἐξ οὗ δὴ τὰ πρῶτα διαστήτην ἐρίσαντε\n\n\nἈτρεΐδης τε ἄναξ ἀνδρῶν καὶ δῖος Ἀχιλλεύς."

@test transcodeGreek(iliad) == transcodeGreek(iliadBadBeta)

# Test Documentation Coverage

@test begin
   gcs = map(collect(BetaReader.bigLookup)) do c
     c[1] 
   end

   alphas = filter(c -> BetaReader.isAlphabetic(c), gcs) 
   diacritics = filter(c -> BetaReader.isDiacritical(c), gcs) 
   puncts = filter(c -> BetaReader.isPunctuation(c), gcs) 
   archaics = filter(c -> BetaReader.isArchaic(c), gcs) 
   edits = filter(c -> BetaReader.isEditorial(c), gcs)
   math = filter(c -> BetaReader.isMathematical(c), gcs)


   cats = collect(Iterators.flatten([alphas, diacritics, puncts, archaics, edits, math]))


   catSizes = length(cats)

   catLength = sum(catSizes)
   gcsLength = length(gcs)

   if (catLength != gcsLength)
     z = setdiff(gcs, cats)
     println("$catLength $gcsLength")
     println("Missing: $z")
   end
   catLength == gcsLength


end

end

