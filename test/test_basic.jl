

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


@test get(BetaReader.bigBetaLookup,"b","#")[1] == "β"
@test get(BetaReader.bigBetaLookup,"g","#")[1] == "γ"
@test get(BetaReader.bigBetaLookup,"&","#") == "#"
@test get(BetaReader.bigBetaLookup,"","#") == "#"

@test BetaReader.betaToUnicode("mh=nin") == "μῆνιν"
@test BetaReader.betaToUnicode("Mh=nin") == "Μῆνιν"
@test BetaReader.betaToUnicode("a)/eide") == "ἄειδε"
@test BetaReader.betaToUnicode("qea/") == "θεά"
@test BetaReader.betaToUnicode("Phlhi+a/dew") == "Πηληϊάδεω"
@test BetaReader.betaToUnicode("A)xilh=os ") == "Ἀχιλῆος "
@test BetaReader.betaToUnicode("lus-") == "λυσ-"
@test BetaReader.betaToUnicode("A)xilh=os") == "Ἀχιλῆος" # The stem is "λυσ-"
@test BetaReader.betaToUnicode("*phlhi+a/dew") == "Πηληϊάδεω"
@test BetaReader.betaToUnicode("*a)xilh=os ") == "Ἀχιλῆος "
@test BetaReader.betaToUnicode("") == ""
@test BetaReader.betaToUnicode("mh=nin a)/eide qea/, *phlhi+a/dew *a)xilh=os ") == "μῆνιν ἄειδε θεά, Πηληϊάδεω Ἀχιλῆος "


@test BetaReader.betaToUnicode("*a)xilh=os\nou)lome/nhn") == "Ἀχιλῆος\nοὐλομένην"
@test BetaReader.betaToUnicode("ou)lome/nhn, h(\\ muri/'") == "οὐλομένην, ἣ μυρί\u2019"
@test BetaReader.betaToUnicode("a)/lge' e)/qhke,") == "ἄλγε’ ἔθηκε,"
@test BetaReader.betaToUnicode("di=os A)xilleu/s.") == "δῖος Ἀχιλλεύς."
@test BetaReader.betaToUnicode("cune/hke ma/xesqai;") == "ξυνέηκε μάχεσθαι;"
@test BetaReader.betaToUnicode("ma/xesqai") == "μάχεσθαι"
@test BetaReader.betaToUnicode(""""di=os" A)xilleu/s.""") == """"δῖος" Ἀχιλλεύς."""
@test BetaReader.betaToUnicode(""""di=os" *a)xilleu/s.""") == """"δῖος" Ἀχιλλεύς."""

@test BetaReader.betaToUnicode("di=o?s A)xilleu/s.") == "δῖο\u0323ς Ἀχιλλεύς."

# Test upper-casing
@test BetaReader.betaToUnicode("*sigma") == "Σιγμα"
@test BetaReader.betaToUnicode("Sigma") == "Σιγμα"

# Test checking for punctuation
@test BetaReader.isPunctuation(".")
@test BetaReader.isPunctuation(",")
@test BetaReader.isPunctuation(":")
@test BetaReader.isPunctuation("#")
@test BetaReader.isPunctuation("a") == false
@test BetaReader.isPunctuation("") == false


# Test export
@test betaToUnicode("di=o?s A)xilleu/s.") == "δῖο\u0323ς Ἀχιλλεύς."

# Test the esoteric "#…" codes

@test betaToUnicode("d# e# a#") == "δ\u02B9 ε\u02B9 α\u02B9" # numeric marker
@test betaToUnicode("a #1 b") == "α \u03DF β" # lc koppa
@test betaToUnicode("a *#1 b") == "α \u03DE β" # uc koppa
@test betaToUnicode("a #11 b") == "α \u03FF β" # Greek Capital Reversed Dotted Lunate Sigma Symbol
@test betaToUnicode("#12 b") == "\u2014 β" # EM Dash ‣ Obelus
@test betaToUnicode("*#12 b") == "\u2014 β" # Obelus can't be uppercased, so just deal with it…
@test betaToUnicode("*#2 b") == "\u03DA β" # uc stigma
@test betaToUnicode("#2 b") == "\u03DB β" # lc stigma 
@test betaToUnicode("*#3 b") == "\u03D8 β" # uc archaic koppa
@test betaToUnicode("#3 b") == "\u03D9 β" # lc archaic koppa
@test betaToUnicode("#4 b") == "\u03DE β" #  Greek Letter Koppa → glyph variant of Greek Letter Koppa
@test betaToUnicode("*#5 b") == "\u03E0 β" # uc sampi
@test betaToUnicode("#5 b") == "\u03E1 β" # lc sampi
@test betaToUnicode("#6 b") == "\u2E0F β" # paragraphos
@test betaToUnicode("#8 b") == "\u2E10 β" # Forked Paragraphos
@test betaToUnicode("#9 b") == "\u0301 β" # Combining Acute Accent → editorial
@test betaToUnicode("#10 b") == "\u03FD β" # Greek Capital Reversed Lunate Sigma Symbol

@test betaToUnicode("#13 b") == "\u203B β" # ※ Reference Mark ‣ Asteriskos
@test betaToUnicode("#14 b") == "\u2E16 β" # ⸖ Dotted Right Pointing Angle • Diple Periestigmene
@test betaToUnicode("#15 b") == "\u003E β" # > Greater-Than Sign ‣ Diple
@test betaToUnicode("#16 b") == "\u03FE β" # Greek Capital Dotted Lunate Sigma Symbol
@test betaToUnicode("#17 b") == "\u002F β" # / Solidus ‣ Obelus
@test betaToUnicode("#18 b") == "\u003C β" # < Less-Than Sign ‣ Reversed Diple
@test betaToUnicode("#19 b") == "\u0300 β" # ◌̂ Combining Grave Accent → editorial
@test betaToUnicode("#53 b") == "\u205D β" #  ⁝ tricolon
@test betaToUnicode("#150 b") == "\u221E β" # infinity

@test betaToUnicode("#400 b") == "\u0371 β" # archaic letter heta (lc)
@test betaToUnicode("*#400 b") == "\u0370 β" # archaic letter heta (uc)



@test betaToUnicode("% b") == "\u2020 β" #  † dagger/crux
@test betaToUnicode("%13 b") == "\u2021 β" #  ‡ double-dagger
@test betaToUnicode("%158 b") == "\u2042 β" #  ⁂ asterism
@test betaToUnicode("%163 b") == "\u00B6 β" # ¶ paragraph sign


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

@test BetaReader.betaToUnicode("#45") == "#"
@test BetaReader.betaToUnicode("@") == "#"
@test BetaReader.betaToUnicode("j") == "#"

# Arabic Numerals should just pass through

@test BetaReader.betaToUnicode("4") == "4"
@test BetaReader.betaToUnicode("2") == "2"
@test BetaReader.betaToUnicode("0") == "0"


# Test Documentation Coverage

@test begin
   gcs = map(collect(BetaReader.bigBetaLookup)) do c
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

@test begin
  BetaReader.normalizeUCGreek("αβγ") == "αβγ"
end

#=
@test begin
  BetaReader.ucToLatin("αβγ") == "abg"
end
=#

#=
@test begin
  BetaReader.unicodeToBeta("αβγ") == "abg"
end
=#

@test begin
  testMap = BetaReader.tlMap("α", "a", "a", "a") 
  testMap.ucode == "α"
  testMap.bcode == "a"
  testMap.latinUC == "a"
  testMap.latinAscii == "a"
end

@test begin
    testString = ")=|a"
    sortedString = BetaReader.sort_greek_character(testString)
    sortedString == "a)=|"
end

#=
@test begin
  testString = BetaReader.unicodeToBeta("μῆνιν ἄειδε θεά")
  println(typeof(testString))
  typeof(testString) == AbstractString
end
=#


end

