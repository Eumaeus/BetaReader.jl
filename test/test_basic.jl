

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
 @test_broken BetaReader.isBreathing("a")
@test BetaReader.isAccent("/")
@test BetaReader.isAccent("\\")
@test BetaReader.isAccent("=")
@test_broken BetaReader.isAccent("(")

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
@test_broken BetaReader.isDiphthong("hi")
@test_broken BetaReader.isDiphthong("io")
@test BetaReader.isDiphthong("Ai")
@test BetaReader.isDiphthong("Ei")
@test BetaReader.isDiphthong("Ou")
@test_broken BetaReader.isDiphthong("Hi")
@test_broken BetaReader.isDiphthong("Io")

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

@test_broken BetaReader.isUC("a")
@test_broken BetaReader.isUC("b")
@test_broken BetaReader.isUC("c")
@test_broken BetaReader.isUC("=")
@test_broken BetaReader.isUC(".")


@test get(BetaReader.bigLookup,"b","#") == "β"
@test get(BetaReader.bigLookup,"g","#") == "γ"
@test get(BetaReader.bigLookup,"&","#") == "#"

@test BetaReader.transcode("mh=nin") == "μῆνιν"
@test BetaReader.transcode("Mh=nin") == "Μῆνιν"
@test BetaReader.transcode("a)/eide") == "ἄειδε"
@test BetaReader.transcode("qea/") == "θεά"
@test BetaReader.transcode("Phlhi+a/dew") == "Πηληϊάδεω"
@test BetaReader.transcode("A)xilh=os") == "Ἀχιλῆος"
@test BetaReader.transcode("*phlhi+a/dew") == "Πηληϊάδεω"
@test BetaReader.transcode("*a)xilh=os") == "Ἀχιλῆος"


@test BetaReader.transcode("*a)xilh=os\nou)lome/nhn") == "Ἀχιλῆος\nοὐλομένην"
@test BetaReader.transcode("ou)lome/nhn, h(\\ muri/'") == "οὐλομένην, ἣ μυρί\u0039"
@test BetaReader.transcode("a)/lge' e)/qhke,") == "ἄλγε\u0039 ἔθηκε,"
@test BetaReader.transcode("di=os A)xilleu/s.") == "δῖος Ἀχιλλεύς."
@test BetaReader.transcode("cune/hke ma/xesqai;") == "ξυνέηκε μάχεσθαι;"
@test BetaReader.transcode("ma/xesqai") == "μάχεσθαι"
@test BetaReader.transcode(""""di=os" A)xilleu/s.""") == """"δῖος" Ἀχιλλεύς."""
@test BetaReader.transcode("di=o?s A)xilleu/s.") == "δῖο\u0323ς Ἀχιλλεύς."


end

