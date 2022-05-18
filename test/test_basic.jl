

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
end