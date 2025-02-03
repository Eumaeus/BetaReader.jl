@testset "NewTests" begin

			#  consonants
			@test BetaReader.transcodeGreek("b") == "β" 
	  # Misc
   @test BetaReader.transcodeGreek("a)/") == "ἄ" 
   @test BetaReader.transcodeGreek("tw=|") == "τῷ" 
   @test BetaReader.transcodeGreek("a?eide?") == "α̣ειδε̣" 
   @test BetaReader.transcodeGreek("") == "" 
   @test BetaReader.transcodeGreek("a/ e/ h/ i/ o/ u/ w/ A/ E/ H/ I/ O/ U/ W/ i/+ u/+") == "ά έ ή ί ό ύ ώ Ά Έ Ή Ί Ό Ύ Ώ ΐ ΰ"
   @test BetaReader.transcodeGreek("tw=| | th=|") == "τῷ | τῇ" 

    # Long

    @test BetaReader.transcodeGreek("mh=nin a)/eide qea\\ *phlhi+a/dew *)axilh=os | ou)lome/nhn, h(\\ muri/' *)axaioi=s a)/lge' e)/qhke,") == "μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος | οὐλομένην, ἣ μυρί’ Ἀχαιοῖς ἄλγε’ ἔθηκε," 

    # consonants
    @test BetaReader.transcodeGreek("b") == "β"  
    @test BetaReader.transcodeGreek("g") == "γ"  
    @test BetaReader.transcodeGreek("d") == "δ"  
    @test BetaReader.transcodeGreek("z") == "ζ"  
    @test BetaReader.transcodeGreek("q") == "θ"  
    @test BetaReader.transcodeGreek("k") == "κ"  
    @test BetaReader.transcodeGreek("l") == "λ"  
    @test BetaReader.transcodeGreek("m") == "μ"  
    @test BetaReader.transcodeGreek("n") == "ν"  
    @test BetaReader.transcodeGreek("c") == "ξ"  
    @test BetaReader.transcodeGreek("p") == "π"  
    @test BetaReader.transcodeGreek("r") == "ρ"  
    @test BetaReader.transcodeGreek("t") == "τ"  
    @test BetaReader.transcodeGreek("f") == "φ"  
    @test BetaReader.transcodeGreek("x") == "χ"  
    @test BetaReader.transcodeGreek("y") == "ψ"  

    #vowels

    @test BetaReader.transcodeGreek("a") == "α" 
    @test BetaReader.transcodeGreek("e") == "ε" 
    @test BetaReader.transcodeGreek("h") == "η" 
    @test BetaReader.transcodeGreek("i") == "ι" 
    @test BetaReader.transcodeGreek("o") == "ο" 
    @test BetaReader.transcodeGreek("u") == "υ" 
    @test BetaReader.transcodeGreek("w") == "ω" 

    # terminal sigma handled separately in Main.jl; the user shouldn't have to care

    @test BetaReader.transcodeGreek("s") == "ς" 
    @test BetaReader.transcodeGreek("ss") == "σς" 
    @test BetaReader.transcodeGreek("as.") == "ας." 
    @test BetaReader.transcodeGreek("ass") == "ασς" 
    @test BetaReader.transcodeGreek("lu/s-w") == "λύσ-ω"  # hyphen not terminator
    @test BetaReader.transcodeGreek("lu/seis—lu/somen") == "λύσεις—λύσομεν"  # em-dash is terminator

    # Capital letters of various kinds

    @test BetaReader.transcodeGreek("*p") == "Π"  
    @test BetaReader.transcodeGreek("*r") == "Ρ"  
    @test BetaReader.transcodeGreek("*t") == "Τ"  
    @test BetaReader.transcodeGreek("*f") == "Φ"  
    @test BetaReader.transcodeGreek("X") == "Χ"  
    @test BetaReader.transcodeGreek("U") == "Υ"  
    @test BetaReader.transcodeGreek("A") == "Α" 
    @test BetaReader.transcodeGreek("E") == "Ε" 

    # diacriticals

    @test BetaReader.transcodeGreek("a(") == "ἁ" 
    @test BetaReader.transcodeGreek("a)") == "ἀ" 
    @test BetaReader.transcodeGreek("a\\") == "ὰ" 
    @test BetaReader.transcodeGreek("a/") == "\u1F71" 
    @test BetaReader.transcodeGreek("e/") == "\u1F73" 
    @test BetaReader.transcodeGreek("h/") == "\u1F75" 
    @test BetaReader.transcodeGreek("i/") == "\u1F77" 
    @test BetaReader.transcodeGreek("o/") == "\u1F79" 
    @test BetaReader.transcodeGreek("u/") == "\u1F7B" 
    @test BetaReader.transcodeGreek("w/") == "\u1F7D" 
    @test BetaReader.transcodeGreek("A/") == "\u1FBB" 
    @test BetaReader.transcodeGreek("E/") == "\u1FC9" 
    @test BetaReader.transcodeGreek("H/") == "\u1FCB" 
    @test BetaReader.transcodeGreek("I/") == "\u1FDB" 
    @test BetaReader.transcodeGreek("O/") == "\u1FF9" 
    @test BetaReader.transcodeGreek("U/") == "\u1FEB" 
    @test BetaReader.transcodeGreek("W/") == "\u1FFB" 
   
    @test BetaReader.transcodeGreek("w=") == "ῶ" 
    @test BetaReader.transcodeGreek("i+") == "ϊ" 
    @test BetaReader.transcodeGreek("w(=|") == "ᾧ" 
    @test BetaReader.transcodeGreek("*)/A") == "Ἄ" 
    @test BetaReader.transcodeGreek("*A)/") == "Ἄ" 
    @test BetaReader.transcodeGreek("hi/+") == "η\u1FD3"  # Should be an oxia: ΐ
    @test BetaReader.transcodeGreek("hi+/") == "η\u1FD3"  # Should be an oxia: ΐ
    @test BetaReader.transcodeGreek("au/+") == "α\u1FE3"  # Should be an oxia: ΰ
    @test BetaReader.transcodeGreek("au+/") == "α\u1FE3"  # Should be an oxia: ΰ
    
    # punctuation

    @test BetaReader.transcodeGreek(" ") == " " 
    @test BetaReader.transcodeGreek(".") == "." 
    @test BetaReader.transcodeGreek(",") == "," 
    @test BetaReader.transcodeGreek(":") == "\u00b7" 
    @test BetaReader.transcodeGreek(";") == ";" 
    @test BetaReader.transcodeGreek("-") == "-" 
    @test BetaReader.transcodeGreek("\n") == "\n" 
    @test BetaReader.transcodeGreek("\t") == "\t" 
    @test BetaReader.transcodeGreek("'") == "\u2019" 
    @test BetaReader.transcodeGreek("\"") == "\""
    @test BetaReader.transcodeGreek("-") == "-" 
    @test BetaReader.transcodeGreek("–") == "–" 
    @test BetaReader.transcodeGreek("—") == "—" 

    # Greek Numeral Sign

    @test BetaReader.transcodeGreek("ia#") == "ια\u02b9" 
    @test BetaReader.transcodeGreek("id#") == "ιδ\u02b9" 
    @test BetaReader.transcodeGreek("kq#") == "κθ\u02b9" 
    @test BetaReader.transcodeGreek("d#22") == "δ\u0375"  #  Greek Lower Numeral Sign

    # archaic letters

    @test BetaReader.transcodeGreek("#1") == "\u03DF" 
    @test BetaReader.transcodeGreek("*#1") == "\u03DE" 
    @test BetaReader.transcodeGreek("#5") == "\u03E1"
    @test BetaReader.transcodeGreek("*#5") == "\u03E0"
    @test BetaReader.transcodeGreek("v") == "\u03DD" 
    @test BetaReader.transcodeGreek("V") == "\u03DC" 
    @test BetaReader.transcodeGreek("*v") == "\u03DC" 
    @test BetaReader.transcodeGreek("#2") == "\u03DB" 
    @test BetaReader.transcodeGreek("#3") == "\u03D9" 
    @test BetaReader.transcodeGreek("#4") == "\u03DE" 
    @test BetaReader.transcodeGreek("#5") == "\u03E1" 
    @test BetaReader.transcodeGreek("#400") == "\u0371" 
    @test BetaReader.transcodeGreek("#711") == "\u03FB"
    @test BetaReader.transcodeGreek("*#711") == "\u03FA" 

    # critical signs

    @test BetaReader.transcodeGreek("#6") == "\u2E0F" 
    @test BetaReader.transcodeGreek("#8") == "\u2E10" 
    @test BetaReader.transcodeGreek("#9") == "\u0301" 
    @test BetaReader.transcodeGreek("#10") == "\u03FD" 
    @test BetaReader.transcodeGreek("#11") == "\u03FF" 
    @test BetaReader.transcodeGreek("#12") == "\u2014" 
    @test BetaReader.transcodeGreek("#13") == "\u203B" 
    @test BetaReader.transcodeGreek("#14") == "\u2E16" 
    @test BetaReader.transcodeGreek("#15") == "\u003E" 
    @test BetaReader.transcodeGreek("#16") == "\u03FE" 
    @test BetaReader.transcodeGreek("#17") == "\u002F" 
    @test BetaReader.transcodeGreek("#18") == "\u003C" 
    @test BetaReader.transcodeGreek("#19") == "\u0300" 
    @test BetaReader.transcodeGreek("#74") == "⁝"  
    @test BetaReader.transcodeGreek("#53") == "\u205D" 
    @test BetaReader.transcodeGreek("#150") == "\u221E" 
    @test BetaReader.transcodeGreek("#310") == "\u2E0E" 
    @test BetaReader.transcodeGreek("#465") == "\u2627" 
    @test BetaReader.transcodeGreek("%") == "\u2020" 
    @test BetaReader.transcodeGreek("%1") == "?" 
    @test BetaReader.transcodeGreek("%5") == "\u007c" 
    @test BetaReader.transcodeGreek("%17") == "\u2016" 
    @test BetaReader.transcodeGreek("%40") == "\u23d1" 
    @test BetaReader.transcodeGreek("%40") == "\u23d1" 
    @test BetaReader.transcodeGreek("%41") == "\u2013" 
    @test BetaReader.transcodeGreek("%42") == "\u23D5" 
    @test BetaReader.transcodeGreek("%43") == "\u00D7" 
    @test BetaReader.transcodeGreek("%44") == "\u23D2" 
    @test BetaReader.transcodeGreek("%45") == "\u23D3" 
    @test BetaReader.transcodeGreek("%46") == "\u23D4" 
    @test BetaReader.transcodeGreek("%141") == "\u23D6" 
    @test BetaReader.transcodeGreek("%13") == "\u2021" 
    @test BetaReader.transcodeGreek("%158") == "\u2042" 
    @test BetaReader.transcodeGreek("%163") == "\u00B6" 
    @test BetaReader.transcodeGreek("a?b?") == "α\u0323β\u0323" 

    # Parentheses

    @test BetaReader.transcodeGreek("[mh=nin]") == "[μῆνιν]" 
    @test BetaReader.transcodeGreek("[1mh=nin]1") == "(μῆνιν)" 
    @test BetaReader.transcodeGreek("[2mh=nin]2") == "\u3008μῆνιν\u3009" 
    @test BetaReader.transcodeGreek("[3mh=nin]3") == "{μῆνιν}" 
    @test BetaReader.transcodeGreek("{mh=nin}") == "{μῆνιν}" 
    @test BetaReader.transcodeGreek("[4mh=nin]4") == "\u27E6μῆνιν\u27E7" 	

end