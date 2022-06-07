# Functions for documenting coverate and equivalances

"Generates and returns a Markdown report of all characters represented in the library"
function printReferenceGuide()
    header = """# Reference Guide\n\n"""

    notes = """For upper-case alphabetic letters, this library accepts upper-case versions of the beta-code equivalent, *e.g.* 'W' → 'Ω', or the `asterisk + lower-case` encoding original to beta-code, *e.g.* '\\*w' → 'Ω'.\n\n"""

    reports = [
        printOneRef(isAlphabetic, "Alphabetic Characters", "Note that medial- and terminal-sigmas will be handled by the transcoding."),
        printOneRef(isDiacritical, "Diacritic Marks"),
        printOneRef(isPunctuation, "Punctuation Characters"),
        printOneRef(isEditorial, "Editorial and Critical Signs"),
        printOneRef(isArchaic, "Archaic and Esoteric Characters"),
        printOneRef(isMathematical, "Mathematical Symbols")

    ] 

    header  * notes * join(reports,"\n\n") * "\n\n" * demos()

end

# Does the work of assembling a Markdown table; takes three parameters: `f` is a function (see Main.jl), `title` is the label of the table, `notes` is whatever should come between the title and the table.
function printOneRef( f = isAlphabetic, title = "Alphabetic Characters", notes = "")

    header = """## Valid $title\n\n$notes\n\n| Unicode | Beta-Code | Description |\n|---------|-----------|-------------|"""

    justThese = begin
        unSorted = collect(filter(k -> f(k.first),bigLookup))
        sort(unSorted, by = x -> x.second[1])
    end

    outputMd = begin
         map(justThese) do p
           desc = p.second[2]
           grkChar = p.second[1]
           #betaChar = replace(p.first, "|" => "\\|", "\u0022" => "\\\u022")
           betaChar = p.first
           if (betaChar == " ") betaChar = "space" end
           if (betaChar == "\n") betaChar = "return" end
           if (betaChar == "\t") betaChar = "tab" end
           if (grkChar == "\t") grkChar = "tab" end
           if (grkChar == " ") grkChar = "space" end
           if (grkChar == "\n") grkChar = "return" end
            "| $grkChar | `$betaChar` | $desc (Unicode $(codepoint(grkChar[1]))) |"
        end
    end

    header * "\n" * join(outputMd, "\n")

end

"A place for putting example beta-code, which will be transcoded and included at the end of the reference guide."
function demos()

    header = """## Examples\n\nThe following examples should give an idea of the relationship between beta-code and Unicode.\n\n| Beta-Code | Unicode|\n|-----|-----|\n"""

    demoStrings = [

    """mh=nin a)/eide qea\\ *phlhi+a/dew *)axilh=os""",
    """ou)lome/nhn, h(\\ muri/' *)axaioi=s a)/lge' e)/qhke,""",
    """polla\\s d' i)fqi/mous yuxa\\s *)/ai+di proi+/ayen""", 
    """h(rw/wn, au)tou\\s de\\ e(lw/ria teu=xe ku/nessin""", 
    """oi)wnoi=si/ te pa=si, *dio\\s d' e)telei/eto boulh/,""", 
    """e)c ou(= dh\\ ta\\ prw=ta diasth/thn e)ri/sante""", 
    """*)atrei+/dhs te a)/nac a)ndrw=n kai\\ di=os *)axilleu/s."""

    ]

#    demoMD = map( s -> "$s\n\n$(transcodeGreek(s))\n\n", demoStrings)

    demoMD = map(demoStrings) do s
        """| `$s` | $(transcodeGreek(s)) |"""
    end

    header * join(demoMD, "\n")

end

"Escape iota-subscripts in beta-code for Markdown; not really necessary when using `|`."
function escapeIotaSubsForMD(s)
    r = r"[|]"
    capsFixed = replace(s, r => s"\\|")
    capsFixed
end

