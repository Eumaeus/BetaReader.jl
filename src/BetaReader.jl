module BetaReader

using Unicode
using PolytonicGreek

include("Beta.jl")
include("UCode.jl")
include("Latin.jl")
include("BetaCharDict.jl")
include("UnicodeCharDict.jl")
include("CharDocumentation.jl")



export betaToUnicode
export unicodeToBeta
export printVowels
export printReferenceGuide

end # module
