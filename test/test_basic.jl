

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


@test get(BetaReader.bigLookup,"b","#")[1] == "??"
@test get(BetaReader.bigLookup,"g","#")[1] == "??"
@test get(BetaReader.bigLookup,"&","#") == "#"
@test get(BetaReader.bigLookup,"","#") == "#"

@test BetaReader.transcodeGreek("mh=nin") == "???????????"
@test BetaReader.transcodeGreek("Mh=nin") == "???????????"
@test BetaReader.transcodeGreek("a)/eide") == "???????????"
@test BetaReader.transcodeGreek("qea/") == "??????"
@test BetaReader.transcodeGreek("Phlhi+a/dew") == "??????????????????"
@test BetaReader.transcodeGreek("A)xilh=os") == "????????????????"
@test BetaReader.transcodeGreek("*phlhi+a/dew") == "??????????????????"
@test BetaReader.transcodeGreek("*a)xilh=os") == "????????????????"
@test BetaReader.transcodeGreek("") == ""
@test BetaReader.transcodeGreek("mh=nin a)/eide qea/, *phlhi+a/dew *a)xilh=os") == "??????????? ??????????? ??????, ?????????????????? ????????????????"


@test BetaReader.transcodeGreek("*a)xilh=os\nou)lome/nhn") == "????????????????\n???????????????????"
@test BetaReader.transcodeGreek("ou)lome/nhn, h(\\ muri/'") == "???????????????????, ??? ????????\u0027"
@test BetaReader.transcodeGreek("a)/lge' e)/qhke,") == "?????????\u0027 ???????????,"
@test BetaReader.transcodeGreek("di=os A)xilleu/s.") == "????????? ?????????????????."
@test BetaReader.transcodeGreek("cune/hke ma/xesqai;") == "?????????????? ????????????????;"
@test BetaReader.transcodeGreek("ma/xesqai") == "????????????????"
@test BetaReader.transcodeGreek(""""di=os" A)xilleu/s.""") == """"?????????" ?????????????????."""
@test BetaReader.transcodeGreek(""""di=os" *a)xilleu/s.""") == """"?????????" ?????????????????."""

@test BetaReader.transcodeGreek("di=o?s A)xilleu/s.") == "???????\u0323?? ?????????????????."

# Test upper-casing
@test BetaReader.transcodeGreek("*sigma") == "??????????"
@test BetaReader.transcodeGreek("Sigma") == "??????????"

# Test checking for punctuation
@test BetaReader.isPunctuation(".")
@test BetaReader.isPunctuation(",")
@test BetaReader.isPunctuation(":")
@test BetaReader.isPunctuation("#")
@test BetaReader.isPunctuation("a") == false
@test BetaReader.isPunctuation("") == false


# Test export
@test transcodeGreek("di=o?s A)xilleu/s.") == "???????\u0323?? ?????????????????."

# Test the esoteric "#???" codes

@test transcodeGreek("d# e# a#") == "??\u02B9 ??\u02B9 ??\u02B9" # numeric marker
@test transcodeGreek("a #1 b") == "?? \u03DF ??" # lc koppa
@test transcodeGreek("a *#1 b") == "?? \u03DE ??" # uc koppa
@test transcodeGreek("a #11 b") == "?? \u03FF ??" # Greek Capital Reversed Dotted Lunate Sigma Symbol
@test transcodeGreek("#12 b") == "\u2014 ??" # EM Dash ??? Obelus
@test transcodeGreek("*#12 b") == "\u2014 ??" # Obelus can't be uppercased, so just deal with it???
@test transcodeGreek("*#2 b") == "\u03DA ??" # uc stigma
@test transcodeGreek("#2 b") == "\u03DB ??" # lc stigma 
@test transcodeGreek("*#3 b") == "\u03D8 ??" # uc archaic koppa
@test transcodeGreek("#3 b") == "\u03D9 ??" # lc archaic koppa
@test transcodeGreek("#4 b") == "\u03DE ??" #  Greek Letter Koppa ??? glyph variant of Greek Letter Koppa
@test transcodeGreek("*#5 b") == "\u03E0 ??" # uc sampi
@test transcodeGreek("#5 b") == "\u03E1 ??" # lc sampi
@test transcodeGreek("#6 b") == "\u2E0F ??" # paragraphos
@test transcodeGreek("#8 b") == "\u2E10 ??" # Forked Paragraphos
@test transcodeGreek("#9 b") == "\u0301 ??" # Combining Acute Accent ??? editorial
@test transcodeGreek("#10 b") == "\u03FD ??" # Greek Capital Reversed Lunate Sigma Symbol

@test transcodeGreek("#13 b") == "\u203B ??" # ??? Reference Mark ??? Asteriskos
@test transcodeGreek("#14 b") == "\u2E16 ??" # ??? Dotted Right Pointing Angle ??? Diple Periestigmene
@test transcodeGreek("#15 b") == "\u003E ??" # > Greater-Than Sign ??? Diple
@test transcodeGreek("#16 b") == "\u03FE ??" # Greek Capital Dotted Lunate Sigma Symbol
@test transcodeGreek("#17 b") == "\u002F ??" # / Solidus ??? Obelus
@test transcodeGreek("#18 b") == "\u003C ??" # < Less-Than Sign ??? Reversed Diple
@test transcodeGreek("#19 b") == "\u0300 ??" # ????? Combining Grave Accent ??? editorial
@test transcodeGreek("#53 b") == "\u205D ??" #  ??? tricolon
@test transcodeGreek("#150 b") == "\u221E ??" # infinity

@test transcodeGreek("#400 b") == "\u0371 ??" # archaic letter heta (lc)
@test transcodeGreek("*#400 b") == "\u0370 ??" # archaic letter heta (uc)



@test transcodeGreek("% b") == "\u2020 ??" #  ??? dagger/crux
@test transcodeGreek("%13 b") == "\u2021 ??" #  ??? double-dagger
@test transcodeGreek("%158 b") == "\u2042 ??" #  ??? asterism
@test transcodeGreek("%163 b") == "\u00B6 ??" # ?? paragraph sign


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

# Arabic Numerals should just pass through

@test BetaReader.transcodeGreek("4") == "4"
@test BetaReader.transcodeGreek("2") == "2"
@test BetaReader.transcodeGreek("0") == "0"



# Truth test

iliad = """mh=nin a)/eide qea\\ *phlhi+a/dew *a)xilh=os\n
ou)lome/nhn, h(\\ muri/' *a)xaioi=s a)/lge' e)/qhke,\n
polla\\s d' i)fqi/mous yuxa\\s *a)/i+di proi+/ayen\n
h(rw/wn, au)tou\\s de\\ e(lw/ria teu=xe ku/nessin\n
oi)wnoi=si/ te pa=si, *dio\\s d' e)telei/eto boulh/,\n
e)c ou(= dh\\ ta\\ prw=ta diasth/thn e)ri/sante\n
*a)trei+/dhs te a)/nac a)ndrw=n kai\\ di=os *a)xilleu/s."""

iliadBadBeta = """mh=nin a)/eide qea\\ *phlhi+a/dew *)axilh=os\n
ou)lome/nhn, h(\\ muri/' *)axaioi=s a)/lge' e)/qhke,\n
polla\\s d' i)fqi/mous yuxa\\s *)/ai+di proi+/ayen\n
h(rw/wn, au)tou\\s de\\ e(lw/ria teu=xe ku/nessin\n
oi)wnoi=si/ te pa=si, *dio\\s d' e)telei/eto boulh/,\n
e)c ou(= dh\\ ta\\ prw=ta diasth/thn e)ri/sante\n
*)atrei+/dhs te a)/nac a)ndrw=n kai\\ di=os *)axilleu/s."""



typedIliad = """??????????? ??????????? ??????? ?????????????????? ????????????????\n\n???????????????????, ??? ????????' ???????????????? ?????????' ???????????,\n\n????????????? ??' ????????????????? ??????????? ????????? ????????????????\n\n???????????, ?????????????? ????? ????????????? ??????????? ????????????????\n\n?????????????????? ???? ?????????, ????????? ??' ??????????????????? ??????????,\n\n????? ????? ????? ????? ??????????? ?????????????????? ?????????????????\n\n????????????????? ???? ????????? ?????????????? ??????? ????????? ?????????????????."""

#=
println("transcodeGreek(iliad) length = $(length(transcodeGreek(iliad)))")
println("typedIliad length = $(length(typedIliad))")
println("cmp -> $(cmp(transcodeGreek(iliad), typedIliad))")
=#

@test transcodeGreek(iliad) == typedIliad

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

