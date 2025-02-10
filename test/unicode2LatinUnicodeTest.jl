@testset "latinUnicode" begin


   # Decomposition
   @test begin
      decomp1 = BetaReader.nfkc_to_nfkd("μῆνιν ἄειδε θεά")
      decompJS = "μῆνιν ἄειδε θεά"
      decomp1 == decompJS
   end 

			#  consonants
   #=
			@test BetaReader.unicodeToLatinUnicode("β") == "b" 
   @test BetaReader.unicodeToLatinUnicode("ἄ") == "a)/" 
   =#

	  # Misc
   #=
   @test BetaReader.unicodeToLatinUnicode("ἄ") == "a)/" 
   @test BetaReader.unicodeToLatinUnicode("τῷ") == "tw=|" 
   @test BetaReader.unicodeToLatinUnicode("α̣ειδε̣") == "a?eide?" 
   @test BetaReader.unicodeToLatinUnicode("") == "" 
   @test BetaReader.unicodeToLatinUnicode("ά έ ή ί ό ύ ώ Ά Έ Ή Ί Ό Ύ Ώ ΐ ΰ") == "a/ e/ h/ i/ o/ u/ w/ A/ E/ H/ I/ O/ U/ W/ i/+ u/+"
   @test BetaReader.unicodeToLatinUnicode("τῷ | τῇ") == "tw=| | th=|" 
   =#

    # Long

    #=
    @test BetaReader.unicodeToLatinUnicode("μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος | οὐλομένην, ἣ μυρί’ Ἀχαιοῖς ἄλγε’ ἔθηκε,") == "mh=nin a)/eide qea\\ *phlhi+a/dew *)axilh=os | ou)lome/nhn, h(\\ muri/' *)axaioi=s a)/lge' e)/qhke," 
    =#

    # consonants
    @test BetaReader.unicodeToLatinUnicode("β") == "b"  
    @test BetaReader.unicodeToLatinUnicode("γ") == "g"  
    @test BetaReader.unicodeToLatinUnicode("δ") == "d"  
    @test BetaReader.unicodeToLatinUnicode("ζ") == "z"  
    @test BetaReader.unicodeToLatinUnicode("θ") == "th"  
    @test BetaReader.unicodeToLatinUnicode("κ") == "k"  
    @test BetaReader.unicodeToLatinUnicode("λ") == "l"  
    @test BetaReader.unicodeToLatinUnicode("μ") == "m"  
    @test BetaReader.unicodeToLatinUnicode("ν") == "n"  
    @test BetaReader.unicodeToLatinUnicode("ξ") == "x"  
    @test BetaReader.unicodeToLatinUnicode("π") == "p"  
    @test BetaReader.unicodeToLatinUnicode("ρ") == "r"  
    @test BetaReader.unicodeToLatinUnicode("τ") == "t"  
    @test BetaReader.unicodeToLatinUnicode("φ") == "ph"  
    @test BetaReader.unicodeToLatinUnicode("χ") == "ch"  
    @test BetaReader.unicodeToLatinUnicode("ψ") == "ps"  

    #vowels
    @test BetaReader.unicodeToLatinUnicode("α") == "a" 
    @test BetaReader.unicodeToLatinUnicode("ε") == "e" 
    @test BetaReader.unicodeToLatinUnicode("η") == "ē" 
    @test BetaReader.unicodeToLatinUnicode("ι") == "i" 
    @test BetaReader.unicodeToLatinUnicode("ο") == "o" 
    @test BetaReader.unicodeToLatinUnicode("υ") == "u" 
    @test BetaReader.unicodeToLatinUnicode("ω") == "ō" 

    #upper-case
    @test BetaReader.unicodeToLatinUnicode("Α") == "A" 
    @test BetaReader.unicodeToLatinUnicode("Β") == "B" 
    @test BetaReader.unicodeToLatinUnicode("Γ") == "G"
    @test BetaReader.unicodeToLatinUnicode("Δ") == "D"
    @test BetaReader.unicodeToLatinUnicode("Ε") == "E"
    @test BetaReader.unicodeToLatinUnicode("Ζ") == "Z"
    @test BetaReader.unicodeToLatinUnicode("Η") == "Ē"
    @test BetaReader.unicodeToLatinUnicode("Θ") == "Th"
    @test BetaReader.unicodeToLatinUnicode("Ι") == "I"
    @test BetaReader.unicodeToLatinUnicode("Κ") == "K"
    @test BetaReader.unicodeToLatinUnicode("Λ") == "L"
    @test BetaReader.unicodeToLatinUnicode("Μ") == "M"
    @test BetaReader.unicodeToLatinUnicode("Ν") == "N"
    @test BetaReader.unicodeToLatinUnicode("Ξ") == "X"
    @test BetaReader.unicodeToLatinUnicode("Ψ") == "Ps"
    @test BetaReader.unicodeToLatinUnicode("Χ") == "Ch"
       


    # sigmas
    @test BetaReader.unicodeToLatinUnicode("αβγδ") == "abgd" 

    @test BetaReader.unicodeToLatinUnicode("ς") == "s" 
    @test BetaReader.unicodeToLatinUnicode("σ") == "s" 
    @test BetaReader.unicodeToLatinUnicode("σς") == "ss" 
    @test BetaReader.unicodeToLatinUnicode("ας.") == "as." 
    @test BetaReader.unicodeToLatinUnicode("ασς") == "ass" 
    @test BetaReader.unicodeToLatinUnicode("ϲ") == "s" 
    @test BetaReader.unicodeToLatinUnicode("λύσ-ω") == "lus-ō" 
    @test BetaReader.unicodeToLatinUnicode("λύσεις-λύσομεν") == "luseis-lusomen"  

    # Capital letters of various kinds

    @test BetaReader.unicodeToLatinUnicode("Π") == "P"  
    @test BetaReader.unicodeToLatinUnicode("Ρ") == "R"  
    @test BetaReader.unicodeToLatinUnicode("Τ") == "T"  
    @test BetaReader.unicodeToLatinUnicode("Φ") == "Ph"  
    @test BetaReader.unicodeToLatinUnicode("Χ") == "Ch"
    @test BetaReader.unicodeToLatinUnicode("Υ") == "U"  
    @test BetaReader.unicodeToLatinUnicode("Α") == "A" 
    @test BetaReader.unicodeToLatinUnicode("Ε") == "E" 

    # diacriticals

    @test BetaReader.unicodeToLatinUnicode("ἁ") == "ha" 
    @test BetaReader.unicodeToLatinUnicode("ἀ") == "a" 
    @test BetaReader.unicodeToLatinUnicode("ὰ") == "a" 
    @test BetaReader.unicodeToLatinUnicode("\u1F71") == "a" 
    @test BetaReader.unicodeToLatinUnicode("\u1F73") == "e" 
    @test BetaReader.unicodeToLatinUnicode("\u1F75") == "ē" 
    @test BetaReader.unicodeToLatinUnicode("\u1F77") == "i" 
    @test BetaReader.unicodeToLatinUnicode("\u1F79") == "o" 
    @test BetaReader.unicodeToLatinUnicode("\u1F7B") == "u" 
    @test BetaReader.unicodeToLatinUnicode("\u1F7D") == "ō" 
    @test BetaReader.unicodeToLatinUnicode("\u1FBB") == "A" 
    @test BetaReader.unicodeToLatinUnicode("\u1FC9") == "E" 
    @test BetaReader.unicodeToLatinUnicode("\u1FCB") == "Ē" 
    @test BetaReader.unicodeToLatinUnicode("\u1FDB") == "I" 
    @test BetaReader.unicodeToLatinUnicode("\u1FF9") == "O" 
    @test BetaReader.unicodeToLatinUnicode("\u1FEB") == "U" 
    @test BetaReader.unicodeToLatinUnicode("\u1FFB") == "Ō" 
   
    @test BetaReader.unicodeToLatinUnicode("ῶ") == "ō" 
    @test BetaReader.unicodeToLatinUnicode("ϊ") == "ï" 
    @test BetaReader.unicodeToLatinUnicode("ᾧ") == "hōi" 
    @test BetaReader.unicodeToLatinUnicode("Ἄ") == "A" 
    @test BetaReader.unicodeToLatinUnicode("Ἄ") == "A" 
    @test BetaReader.unicodeToLatinUnicode("Ἁ") == "Ha" 
    @test BetaReader.unicodeToLatinUnicode("η\u1FD3") == "ēï"  
    @test BetaReader.unicodeToLatinUnicode("α\u1FE3") == "aü"  

    # Correct order of diacritical marks
    @test BetaReader.unicodeToLatinUnicode("ηΐα") == "ēïa"
    @test BetaReader.unicodeToLatinUnicode("ηῒ") == "ēï"

    # rough breathing stuff
    @test BetaReader.unicodeToLatinUnicode("ῥαββί") == "rhabbi" 
    @test BetaReader.unicodeToLatinUnicode("Ῥαββί") == "Rhabbi" 
    @test BetaReader.unicodeToLatinUnicode("ἁμαρτία") == "hamartia" 
    @test BetaReader.unicodeToLatinUnicode("Ἁμαρτία") == "Hamartia" 
    @test BetaReader.unicodeToLatinUnicode("ὁ") == "ho"
    @test BetaReader.unicodeToLatinUnicode("Ὁ") == "Ho"
    @test BetaReader.unicodeToLatinUnicode("οἱ") == "hoi"
    @test BetaReader.unicodeToLatinUnicode("Οἱ") == "Hoi"
    @test BetaReader.unicodeToLatinUnicode("αἱ") == "hai"
    @test BetaReader.unicodeToLatinUnicode("υἱ") == "hui"
    @test BetaReader.unicodeToLatinUnicode("αὑ") == "hau"
    @test BetaReader.unicodeToLatinUnicode("ᾇ") == "hai"
    @test BetaReader.unicodeToLatinUnicode("εἱ") == "hei"
    @test BetaReader.unicodeToLatinUnicode("εὑ") == "heu"
    @test BetaReader.unicodeToLatinUnicode("ηὑ") == "hēu"
    @test BetaReader.unicodeToLatinUnicode("Αἱ") == "Hai"
    @test BetaReader.unicodeToLatinUnicode("Αὑ") == "Hau"
    @test BetaReader.unicodeToLatinUnicode("ᾏ") == "Hai"
    @test BetaReader.unicodeToLatinUnicode("Αἱ") == "Hai"
    @test BetaReader.unicodeToLatinUnicode("Εἱ") == "Hei"
    @test BetaReader.unicodeToLatinUnicode("Εὑ") == "Heu"
    @test BetaReader.unicodeToLatinUnicode("Ηὑ") == "Hēu"
    @test BetaReader.unicodeToLatinUnicode("ᾑ") == "hēi"
    @test BetaReader.unicodeToLatinUnicode("ᾙ") == "Hēi"
    @test BetaReader.unicodeToLatinUnicode("ᾕ") == "hēi"
    @test BetaReader.unicodeToLatinUnicode("ἵ") == "hi"
    @test BetaReader.unicodeToLatinUnicode("ἷ") == "hi"
    @test BetaReader.unicodeToLatinUnicode("Ἵ") == "Hi"
    @test BetaReader.unicodeToLatinUnicode("οἱ") == "hoi"
    @test BetaReader.unicodeToLatinUnicode("οὑ") == "hou"
    @test BetaReader.unicodeToLatinUnicode("Οἱ") == "Hoi"
    @test BetaReader.unicodeToLatinUnicode("Οὑ") == "Hou"
    @test BetaReader.unicodeToLatinUnicode("ᾡ") == "hōi"
    @test BetaReader.unicodeToLatinUnicode("ᾥ") == "hōi"
    @test BetaReader.unicodeToLatinUnicode("ᾩ") == "Hōi"
    @test BetaReader.unicodeToLatinUnicode("ᾙ") == "Hēi"


  


    # punctuation

    @test BetaReader.unicodeToLatinUnicode(" ") == " " 
    @test BetaReader.unicodeToLatinUnicode(".") == "." 
    @test BetaReader.unicodeToLatinUnicode(",") == "," 
    @test BetaReader.unicodeToLatinUnicode("\u00b7") == ":" 
    @test BetaReader.unicodeToLatinUnicode(";") == "?" 
    @test BetaReader.unicodeToLatinUnicode("-") == "-" 
    @test BetaReader.unicodeToLatinUnicode("\n") == "\n" 
    @test BetaReader.unicodeToLatinUnicode("\t") == "\t" 
    @test BetaReader.unicodeToLatinUnicode("μυρί’") == "muri’" 

    

    @test BetaReader.unicodeToLatinUnicode("\u03DD") == "v" 
    @test BetaReader.unicodeToLatinUnicode("\u03DC") == "V" 
    @test BetaReader.unicodeToLatinUnicode("\u03DC") == "V" 

    # Parentheses

    @test BetaReader.unicodeToLatinUnicode("[μῆνιν]") == "[mēnin]" 
    @test BetaReader.unicodeToLatinUnicode("(μῆνιν)") == "(mēnin)" 
    @test BetaReader.unicodeToLatinUnicode("{μῆνιν}") == "{mēnin}" 


    # Bigger tests
    @test begin
      s = "μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος\nοὐλομένην, ἣ μυρί’ Ἀχαιοῖς ἄλγε’ ἔθηκε,\nπολλὰς δ’ ἰφθίμους ψυχὰς Ἄϊδι προΐαψεν"
      lat = BetaReader.unicodeToLatinUnicode(s)
      true
    end 

    # Beta to Latin
    @test begin
      uctext = "μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος\nοὐλομένην, ἣ μυρί’ Ἀχαιοῖς ἄλγε’ ἔθηκε,\nπολλὰς δ’ ἰφθίμους ψυχὰς Ἄϊδι προΐαψεν"
      uclat = BetaReader.unicodeToLatinUnicode(uctext)
      bctext = "mh=nin a)/eide qea\\ *phlhi+a/dew *)axilh=os\nou)lome/nhn, h(\\ muri/' *)axaioi=s a)/lge' e)/qhke,\npolla\\s d' i)fqi/mous yuxa\\s *)/ai+di proi+/ayen"
      bclat = BetaReader.betacodeToLatinUnicode(bctext)
      uclat == bclat
    end 


end