@testset "unicode" begin


   # Decomposition
   @test begin
      decomp1 = BetaReader.nfkc_to_nfkd("μῆνιν ἄειδε θεά")
      decompJS = "μῆνιν ἄειδε θεά"
      decomp1 == decompJS
   end 

			#  consonants
   #=
			@test BetaReader.unicodeToBeta("β") == "b" 
   @test BetaReader.unicodeToBeta("ἄ") == "a)/" 
   =#

	  # Misc
   #=
   @test BetaReader.unicodeToBeta("ἄ") == "a)/" 
   @test BetaReader.unicodeToBeta("τῷ") == "tw=|" 
   @test BetaReader.unicodeToBeta("α̣ειδε̣") == "a?eide?" 
   @test BetaReader.unicodeToBeta("") == "" 
   @test BetaReader.unicodeToBeta("ά έ ή ί ό ύ ώ Ά Έ Ή Ί Ό Ύ Ώ ΐ ΰ") == "a/ e/ h/ i/ o/ u/ w/ A/ E/ H/ I/ O/ U/ W/ i/+ u/+"
   @test BetaReader.unicodeToBeta("τῷ | τῇ") == "tw=| | th=|" 
   =#

    # Long

   @test begin
      s = "οὐλομένην, ἣ μυρί᾽ Ἀχαιοῖς ἄλγε᾽ ἔθηκε,"
      bc = BetaReader.unicodeToBeta(s)
      bc == "ou)lome/nhn, h(\\ muri/' A)xaioi=s a)/lge' e)/qhke,"
   end

   @test begin
      s = "μυρί᾽"
      bc = BetaReader.unicodeToBeta(s)
      bc == "muri/'"
   end

   @test begin
      s = "οὐλομένην, ἣ μυρί᾽ Ἀχαιοῖς ἄλγε᾽ ἔθηκε,"
      bctest = "ou)lome/nhn, h(\\ muri/' A)xaioi=s a)/lge' e)/qhke,"
      bc = BetaReader.unicodeToBeta(s)
      bctest == bc 
   end
   

   
    #=
    @test BetaReader.unicodeToBeta("μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος | οὐλομένην, ἣ μυρί’ Ἀχαιοῖς ἄλγε’ ἔθηκε,") == "mh=nin a)/eide qea\\ *phlhi+a/dew *)axilh=os | ou)lome/nhn, h(\\ muri/' *)axaioi=s a)/lge' e)/qhke," 
    =#

    # consonants
    @test BetaReader.unicodeToBeta("β") == "b"  
    @test BetaReader.unicodeToBeta("γ") == "g"  
    @test BetaReader.unicodeToBeta("δ") == "d"  
    @test BetaReader.unicodeToBeta("ζ") == "z"  
    @test BetaReader.unicodeToBeta("θ") == "q"  
    @test BetaReader.unicodeToBeta("κ") == "k"  
    @test BetaReader.unicodeToBeta("λ") == "l"  
    @test BetaReader.unicodeToBeta("μ") == "m"  
    @test BetaReader.unicodeToBeta("ν") == "n"  
    @test BetaReader.unicodeToBeta("ξ") == "c"  
    @test BetaReader.unicodeToBeta("π") == "p"  
    @test BetaReader.unicodeToBeta("ρ") == "r"  
    @test BetaReader.unicodeToBeta("τ") == "t"  
    @test BetaReader.unicodeToBeta("φ") == "f"  
    @test BetaReader.unicodeToBeta("χ") == "x"  
    @test BetaReader.unicodeToBeta("ψ") == "y"  

    #vowels
    @test BetaReader.unicodeToBeta("α") == "a" 
    @test BetaReader.unicodeToBeta("ε") == "e" 
    @test BetaReader.unicodeToBeta("η") == "h" 
    @test BetaReader.unicodeToBeta("ι") == "i" 
    @test BetaReader.unicodeToBeta("ο") == "o" 
    @test BetaReader.unicodeToBeta("υ") == "u" 
    @test BetaReader.unicodeToBeta("ω") == "w" 


    # sigmas
    @test BetaReader.unicodeToBeta("αβγδ") == "abgd" 

    @test BetaReader.unicodeToBeta("ς") == "s" 
    @test BetaReader.unicodeToBeta("σ") == "s" 
    @test BetaReader.unicodeToBeta("σς") == "ss" 
    @test BetaReader.unicodeToBeta("ας.") == "as." 
    @test BetaReader.unicodeToBeta("ασς") == "ass" 
    @test BetaReader.unicodeToBeta("ϲ") == "s" 
    @test BetaReader.unicodeToBeta("λύσ-ω") == "lu/s-w" 
    @test BetaReader.unicodeToBeta("λύσεις-λύσομεν") == "lu/seis-lu/somen"  

    # Capital letters of various kinds

    @test BetaReader.unicodeToBeta("Π") == "P"  
    @test BetaReader.unicodeToBeta("Ρ") == "R"  
    @test BetaReader.unicodeToBeta("Τ") == "T"  
    @test BetaReader.unicodeToBeta("Φ") == "F"  
    @test BetaReader.unicodeToBeta("Χ") == "X"  
    @test BetaReader.unicodeToBeta("Υ") == "U"  
    @test BetaReader.unicodeToBeta("Α") == "A" 
    @test BetaReader.unicodeToBeta("Ε") == "E" 

    # diacriticals

    @test BetaReader.unicodeToBeta("ἁ") == "a(" 
    @test BetaReader.unicodeToBeta("ἀ") == "a)" 
    @test BetaReader.unicodeToBeta("ὰ") == "a\\" 
    @test BetaReader.unicodeToBeta("\u1F71") == "a/" 
    @test BetaReader.unicodeToBeta("\u1F73") == "e/" 
    @test BetaReader.unicodeToBeta("\u1F75") == "h/" 
    @test BetaReader.unicodeToBeta("\u1F77") == "i/" 
    @test BetaReader.unicodeToBeta("\u1F79") == "o/" 
    @test BetaReader.unicodeToBeta("\u1F7B") == "u/" 
    @test BetaReader.unicodeToBeta("\u1F7D") == "w/" 
    @test BetaReader.unicodeToBeta("\u1FBB") == "A/" 
    @test BetaReader.unicodeToBeta("\u1FC9") == "E/" 
    @test BetaReader.unicodeToBeta("\u1FCB") == "H/" 
    @test BetaReader.unicodeToBeta("\u1FDB") == "I/" 
    @test BetaReader.unicodeToBeta("\u1FF9") == "O/" 
    @test BetaReader.unicodeToBeta("\u1FEB") == "U/" 
    @test BetaReader.unicodeToBeta("\u1FFB") == "W/" 
   
    @test BetaReader.unicodeToBeta("ῶ") == "w=" 
    @test BetaReader.unicodeToBeta("ϊ") == "i+" 
    @test BetaReader.unicodeToBeta("ᾧ") == "w(=|" 
    @test BetaReader.unicodeToBeta("Ἄ") == "A)/" 
    @test BetaReader.unicodeToBeta("Ἄ") == "A)/" 
    @test BetaReader.unicodeToBeta("η\u1FD3") == "hi+/"  # Should be an oxia: ΐ
    @test BetaReader.unicodeToBeta("α\u1FE3") == "au+/"  # Should be an oxia: ΰ

    # Correct order of diacritical marks
    @test BetaReader.unicodeToBeta("ηΐα") == "hi+/a"
    @test BetaReader.unicodeToBeta("ηῒ") == "hi+\\"

    # punctuation

    @test BetaReader.unicodeToBeta(" ") == " " 
    @test BetaReader.unicodeToBeta(".") == "." 
    @test BetaReader.unicodeToBeta(",") == "," 
    @test BetaReader.unicodeToBeta("\u00b7") == ":" 
    @test BetaReader.unicodeToBeta(";") == ";" 
    @test BetaReader.unicodeToBeta("-") == "-" 
    @test BetaReader.unicodeToBeta("\n") == "\n" 
    @test BetaReader.unicodeToBeta("\t") == "\t" 
    @test BetaReader.unicodeToBeta("\u2019") == "'" 
    @test BetaReader.unicodeToBeta("\"") == "\""
    @test BetaReader.unicodeToBeta("-") == "-" 
    @test BetaReader.unicodeToBeta("–") == "%41" 
    @test BetaReader.unicodeToBeta("—") == "—" 
    @test BetaReader.unicodeToBeta("ε᾽") == "e'"

    # Greek Numeral Sign

    @test BetaReader.unicodeToBeta("ια\u02b9") == "ia#" 
    @test BetaReader.unicodeToBeta("ιδ\u02b9") == "id#" 
    @test BetaReader.unicodeToBeta("κθ\u02b9") == "kq#" 
    @test BetaReader.unicodeToBeta("δ\u0375") == "d#22"  #  Greek Lower Numeral Sign

    # archaic letters

    @test BetaReader.unicodeToBeta("\u03DF") == "#1" # lower-case koppa
    @test BetaReader.unicodeToBeta("\u03DE") == "*#1" # upper-case koppa 
    @test BetaReader.unicodeToBeta("\u03E1") == "#5"
    @test BetaReader.unicodeToBeta("\u03E0") == "*#5"
    @test BetaReader.unicodeToBeta("\u03DD") == "v" 
    @test BetaReader.unicodeToBeta("\u03DC") == "V" 
    @test BetaReader.unicodeToBeta("\u03DC") == "V" 
    @test BetaReader.unicodeToBeta("\u03DB") == "#2" 
    @test BetaReader.unicodeToBeta("\u03D9") == "#3" 
    @test BetaReader.unicodeToBeta("\u03E1") == "#5" 
    @test BetaReader.unicodeToBeta("\u0371") == "#400" 
    @test BetaReader.unicodeToBeta("\u03FB") == "#711"
    @test BetaReader.unicodeToBeta("\u03FA") == "*#711" 

    # critical signs

    @test BetaReader.unicodeToBeta("\u2E0F") == "#6" 
    @test BetaReader.unicodeToBeta("\u2E10") == "#8" 
    @test BetaReader.unicodeToBeta("\u03FD") == "*#10" 
    @test BetaReader.unicodeToBeta("\u03FF") == "*#11" 
    @test BetaReader.unicodeToBeta("\u2014") == "—" 
    @test BetaReader.unicodeToBeta("\u203B") == "#13" 
    @test BetaReader.unicodeToBeta("\u2E16") == "#14" 
    @test BetaReader.unicodeToBeta("\u003E") == "#15" 
    @test BetaReader.unicodeToBeta("\u03FE") == "*#16" 
    @test BetaReader.unicodeToBeta("\u002F") == "#17" 
    @test BetaReader.unicodeToBeta("\u003C") == "#18" 
    @test BetaReader.unicodeToBeta("\u0300") == "\\" 
    @test BetaReader.unicodeToBeta("⁝") == "#74"  
    @test BetaReader.unicodeToBeta("\u205D") == "#74" 
    @test BetaReader.unicodeToBeta("\u221E") == "#150" 
    @test BetaReader.unicodeToBeta("\u2E0E") == "#310" 
    @test BetaReader.unicodeToBeta("\u2627") == "#465" 
    @test BetaReader.unicodeToBeta("\u2020") == "%" 
    @test BetaReader.unicodeToBeta("?") == "%1" 
    @test BetaReader.unicodeToBeta("\u007c") == "%5" 
    @test BetaReader.unicodeToBeta("\u2016") == "%17" 
    @test BetaReader.unicodeToBeta("\u23d1") == "%40" 
    @test BetaReader.unicodeToBeta("\u23d1") == "%40" 
    @test BetaReader.unicodeToBeta("\u23D5") == "%42" 
    @test BetaReader.unicodeToBeta("\u00D7") == "%43" 
    @test BetaReader.unicodeToBeta("\u23D2") == "%44" 
    @test BetaReader.unicodeToBeta("\u23D3") == "%45" 
    @test BetaReader.unicodeToBeta("\u23D4") == "%46" 
    @test BetaReader.unicodeToBeta("\u23D6") == "%141" 
    @test BetaReader.unicodeToBeta("\u2021") == "%13" 
    @test BetaReader.unicodeToBeta("\u2042") == "%158" 
    @test BetaReader.unicodeToBeta("\u00B6") == "%163" 
    @test BetaReader.unicodeToBeta("α\u0323β\u0323") == "a?b?" 

    # Parentheses

    @test BetaReader.unicodeToBeta("[μῆνιν]") == "[mh=nin]" 
    @test BetaReader.unicodeToBeta("(μῆνιν)") == "[1mh=nin]1" 
    @test BetaReader.unicodeToBeta("\u3008μῆνιν\u3009") == "[2mh=nin]2" 
    @test BetaReader.unicodeToBeta("{μῆνιν}") == "[3mh=nin]3" 
    @test BetaReader.unicodeToBeta("\u27E6μῆνιν\u27E7") == "[4mh=nin]4" 	

end