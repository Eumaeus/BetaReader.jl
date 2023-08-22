module BetaReader

using Unicode
using PolytonicGreek

include("Beta.jl")
include("UCode.jl")
include("CharDict.jl")
include("CharDocumentation.jl")

export transcodeGreek
export printVowels
export printReferenceGuide

end # module
