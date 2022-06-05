module BetaReader

using Unicode
using PolytonicGreek

include("Main.jl")
include("CharDict.jl")
include("CharDocumentation.jl")

export transcodeGreek
export printVowels

end # module
