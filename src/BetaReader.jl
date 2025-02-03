module BetaReader

using Unicode
using PolytonicGreek

include("Beta.jl")
include("UCode.jl")
include("BetaCharDict.jl")
include("UnicodeCharDict.jl")
include("CharDocumentation.jl")

export transcodeGreek
export printVowels
export printReferenceGuide

end # module
