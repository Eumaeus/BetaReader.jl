using Pkg
Pkg.activate("..")


using BetaReader
using Compat.Test
using TestSetExtensions

@testset "All the tests" begin
    println(map(s -> replace(s, r".jl$" => ""), ARGS))
    @includetests map(s -> replace(s, r".jl$" => ""), ARGS)
end