@testset "NewTests" begin

			#  consonants
			@test BetaReader.betaToUnicode("b") == "β" 
	  # Misc
   @test BetaReader.betaToUnicode("a)/") == "ἄ" 
   @test BetaReader.betaToUnicode("tw=|") == "τῷ" 
   @test BetaReader.betaToUnicode("a?eide?") == "α̣ειδε̣" 
   @test BetaReader.betaToUnicode("") == "" 
   @test BetaReader.betaToUnicode("a/ e/ h/ i/ o/ u/ w/ A/ E/ H/ I/ O/ U/ W/ i/+ u/+") == "ά έ ή ί ό ύ ώ Ά Έ Ή Ί Ό Ύ Ώ ΐ ΰ"
   @test BetaReader.betaToUnicode("tw=| | th=|") == "τῷ | τῇ" 

    # Long

    @test BetaReader.betaToUnicode("mh=nin a)/eide qea\\ *phlhi+a/dew *)axilh=os | ou)lome/nhn, h(\\ muri/' *)axaioi=s a)/lge' e)/qhke,") == "μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος | οὐλομένην, ἣ μυρί’ Ἀχαιοῖς ἄλγε’ ἔθηκε," 

    # consonants
    @test BetaReader.betaToUnicode("b") == "β"  
    @test BetaReader.betaToUnicode("g") == "γ"  
    @test BetaReader.betaToUnicode("d") == "δ"  
    @test BetaReader.betaToUnicode("z") == "ζ"  
    @test BetaReader.betaToUnicode("q") == "θ"  
    @test BetaReader.betaToUnicode("k") == "κ"  
    @test BetaReader.betaToUnicode("l") == "λ"  
    @test BetaReader.betaToUnicode("m") == "μ"  
    @test BetaReader.betaToUnicode("n") == "ν"  
    @test BetaReader.betaToUnicode("c") == "ξ"  
    @test BetaReader.betaToUnicode("p") == "π"  
    @test BetaReader.betaToUnicode("r") == "ρ"  
    @test BetaReader.betaToUnicode("t") == "τ"  
    @test BetaReader.betaToUnicode("f") == "φ"  
    @test BetaReader.betaToUnicode("x") == "χ"  
    @test BetaReader.betaToUnicode("y") == "ψ"  

    #vowels

    @test BetaReader.betaToUnicode("a") == "α" 
    @test BetaReader.betaToUnicode("e") == "ε" 
    @test BetaReader.betaToUnicode("h") == "η" 
    @test BetaReader.betaToUnicode("i") == "ι" 
    @test BetaReader.betaToUnicode("o") == "ο" 
    @test BetaReader.betaToUnicode("u") == "υ" 
    @test BetaReader.betaToUnicode("w") == "ω" 

    # terminal sigma handled separately in Main.jl; the user shouldn't have to care

    @test BetaReader.betaToUnicode("s") == "ς" 
    @test BetaReader.betaToUnicode("ss") == "σς" 
    @test BetaReader.betaToUnicode("as.") == "ας." 
    @test BetaReader.betaToUnicode("ass") == "ασς" 
    @test BetaReader.betaToUnicode("lu/s-w") == "λύσ-ω"  # hyphen not terminator
    @test BetaReader.betaToUnicode("lu/seis—lu/somen") == "λύσεις—λύσομεν"  # em-dash is terminator

    # Capital letters of various kinds

    @test BetaReader.betaToUnicode("*p") == "Π"  
    @test BetaReader.betaToUnicode("*r") == "Ρ"  
    @test BetaReader.betaToUnicode("*t") == "Τ"  
    @test BetaReader.betaToUnicode("*f") == "Φ"  
    @test BetaReader.betaToUnicode("X") == "Χ"  
    @test BetaReader.betaToUnicode("U") == "Υ"  
    @test BetaReader.betaToUnicode("A") == "Α" 
    @test BetaReader.betaToUnicode("E") == "Ε" 

    # diacriticals

    @test BetaReader.betaToUnicode("a(") == "ἁ" 
    @test BetaReader.betaToUnicode("a)") == "ἀ" 
    @test BetaReader.betaToUnicode("a\\") == "ὰ" 
    @test BetaReader.betaToUnicode("a/") == "\u1F71" 
    @test BetaReader.betaToUnicode("e/") == "\u1F73" 
    @test BetaReader.betaToUnicode("h/") == "\u1F75" 
    @test BetaReader.betaToUnicode("i/") == "\u1F77" 
    @test BetaReader.betaToUnicode("o/") == "\u1F79" 
    @test BetaReader.betaToUnicode("u/") == "\u1F7B" 
    @test BetaReader.betaToUnicode("w/") == "\u1F7D" 
    @test BetaReader.betaToUnicode("A/") == "\u1FBB" 
    @test BetaReader.betaToUnicode("E/") == "\u1FC9" 
    @test BetaReader.betaToUnicode("H/") == "\u1FCB" 
    @test BetaReader.betaToUnicode("I/") == "\u1FDB" 
    @test BetaReader.betaToUnicode("O/") == "\u1FF9" 
    @test BetaReader.betaToUnicode("U/") == "\u1FEB" 
    @test BetaReader.betaToUnicode("W/") == "\u1FFB" 
   
    @test BetaReader.betaToUnicode("w=") == "ῶ" 
    @test BetaReader.betaToUnicode("i+") == "ϊ" 
    @test BetaReader.betaToUnicode("w(=|") == "ᾧ" 
    @test BetaReader.betaToUnicode("*)/A") == "Ἄ" 
    @test BetaReader.betaToUnicode("*A)/") == "Ἄ" 
    @test BetaReader.betaToUnicode("hi/+") == "η\u1FD3"  # Should be an oxia: ΐ
    @test BetaReader.betaToUnicode("hi+/") == "η\u1FD3"  # Should be an oxia: ΐ
    @test BetaReader.betaToUnicode("au/+") == "α\u1FE3"  # Should be an oxia: ΰ
    @test BetaReader.betaToUnicode("au+/") == "α\u1FE3"  # Should be an oxia: ΰ
    
    # punctuation

    @test BetaReader.betaToUnicode(" ") == " " 
    @test BetaReader.betaToUnicode(".") == "." 
    @test BetaReader.betaToUnicode(",") == "," 
    @test BetaReader.betaToUnicode(":") == "\u00b7" 
    @test BetaReader.betaToUnicode(";") == ";" 
    @test BetaReader.betaToUnicode("-") == "-" 
    @test BetaReader.betaToUnicode("\n") == "\n" 
    @test BetaReader.betaToUnicode("\t") == "\t" 
    @test BetaReader.betaToUnicode("'") == "\u2019" 
    @test BetaReader.betaToUnicode("\"") == "\""
    @test BetaReader.betaToUnicode("-") == "-" 
    @test BetaReader.betaToUnicode("–") == "–" 
    @test BetaReader.betaToUnicode("—") == "—" 

    # Greek Numeral Sign

    @test BetaReader.betaToUnicode("ia#") == "ια\u02b9" 
    @test BetaReader.betaToUnicode("id#") == "ιδ\u02b9" 
    @test BetaReader.betaToUnicode("kq#") == "κθ\u02b9" 
    @test BetaReader.betaToUnicode("d#22") == "δ\u0375"  #  Greek Lower Numeral Sign

    # archaic letters

    @test BetaReader.betaToUnicode("#1") == "\u03DF" 
    @test BetaReader.betaToUnicode("*#1") == "\u03DE" 
    @test BetaReader.betaToUnicode("#5") == "\u03E1"
    @test BetaReader.betaToUnicode("*#5") == "\u03E0"
    @test BetaReader.betaToUnicode("v") == "\u03DD" 
    @test BetaReader.betaToUnicode("V") == "\u03DC" 
    @test BetaReader.betaToUnicode("*v") == "\u03DC" 
    @test BetaReader.betaToUnicode("#2") == "\u03DB" 
    @test BetaReader.betaToUnicode("#3") == "\u03D9" 
    @test BetaReader.betaToUnicode("#4") == "\u03DE" 
    @test BetaReader.betaToUnicode("#5") == "\u03E1" 
    @test BetaReader.betaToUnicode("#400") == "\u0371" 
    @test BetaReader.betaToUnicode("#711") == "\u03FB"
    @test BetaReader.betaToUnicode("*#711") == "\u03FA" 

    # critical signs

    @test BetaReader.betaToUnicode("#6") == "\u2E0F" 
    @test BetaReader.betaToUnicode("#8") == "\u2E10" 
    @test BetaReader.betaToUnicode("#9") == "\u0301" 
    @test BetaReader.betaToUnicode("#10") == "\u03FD" 
    @test BetaReader.betaToUnicode("#11") == "\u03FF" 
    @test BetaReader.betaToUnicode("#12") == "\u2014" 
    @test BetaReader.betaToUnicode("#13") == "\u203B" 
    @test BetaReader.betaToUnicode("#14") == "\u2E16" 
    @test BetaReader.betaToUnicode("#15") == "\u003E" 
    @test BetaReader.betaToUnicode("#16") == "\u03FE" 
    @test BetaReader.betaToUnicode("#17") == "\u002F" 
    @test BetaReader.betaToUnicode("#18") == "\u003C" 
    @test BetaReader.betaToUnicode("#19") == "\u0300" 
    @test BetaReader.betaToUnicode("#74") == "⁝"  
    @test BetaReader.betaToUnicode("#53") == "\u205D" 
    @test BetaReader.betaToUnicode("#150") == "\u221E" 
    @test BetaReader.betaToUnicode("#310") == "\u2E0E" 
    @test BetaReader.betaToUnicode("#465") == "\u2627" 
    @test BetaReader.betaToUnicode("%") == "\u2020" 
    @test BetaReader.betaToUnicode("%1") == "?" 
    @test BetaReader.betaToUnicode("%5") == "\u007c" 
    @test BetaReader.betaToUnicode("%17") == "\u2016" 
    @test BetaReader.betaToUnicode("%40") == "\u23d1" 
    @test BetaReader.betaToUnicode("%40") == "\u23d1" 
    @test BetaReader.betaToUnicode("%41") == "\u2013" 
    @test BetaReader.betaToUnicode("%42") == "\u23D5" 
    @test BetaReader.betaToUnicode("%43") == "\u00D7" 
    @test BetaReader.betaToUnicode("%44") == "\u23D2" 
    @test BetaReader.betaToUnicode("%45") == "\u23D3" 
    @test BetaReader.betaToUnicode("%46") == "\u23D4" 
    @test BetaReader.betaToUnicode("%141") == "\u23D6" 
    @test BetaReader.betaToUnicode("%13") == "\u2021" 
    @test BetaReader.betaToUnicode("%158") == "\u2042" 
    @test BetaReader.betaToUnicode("%163") == "\u00B6" 
    @test BetaReader.betaToUnicode("a?b?") == "α\u0323β\u0323" 

    # Parentheses

    @test BetaReader.betaToUnicode("[mh=nin]") == "[μῆνιν]" 
    @test BetaReader.betaToUnicode("[1mh=nin]1") == "(μῆνιν)" 
    @test BetaReader.betaToUnicode("[2mh=nin]2") == "\u3008μῆνιν\u3009" 
    @test BetaReader.betaToUnicode("[3mh=nin]3") == "{μῆνιν}" 
    @test BetaReader.betaToUnicode("{mh=nin}") == "{μῆνιν}" 
    @test BetaReader.betaToUnicode("[4mh=nin]4") == "\u27E6μῆνιν\u27E7" 	

end