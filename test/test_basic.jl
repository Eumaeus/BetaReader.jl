

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

# Test export
@test transcodeGreek("di=o?s A)xilleu/s.") == "δῖο\u0323ς Ἀχιλλεύς."

end

