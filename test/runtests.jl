using Test, MultiPrecisionArrays
using MultiPrecisionArrays.Examples: Gmat
using LinearAlgebra: I, lu!, norm
using SIAMFANLEquations: nsol
using SIAMFANLEquations.TestProblems: heqinit, heqf!, heqJ!
using StaticArrays

import MultiPrecisionArrays.MPArray
import MultiPrecisionArrays.MPHArray
import MultiPrecisionArrays.MPGArray
import MultiPrecisionArrays.MPBArray
import MultiPrecisionArrays.MPLFact
import MultiPrecisionArrays.mpkrir

include("Greens/gtest.jl")
include("NLTest/nltest.jl")
include("DetailsTest/precision_test.jl")
include("DetailsTest/hlu_test.jl")
include("DetailsTest/slashtest.jl")
include("DetailsTest/mplu_test.jl")
include("DetailsTest/AbsArray.jl")
include("DetailsTest/static_test.jl")
include("Krylov-IRTest/mpgmtest.jl")
include("Krylov-IRTest/mpbctest.jl")
include("Krylov-IRTest/hvse.jl")
include("Wilkinson/wilk_test.jl")

println("starting")

@testset "Greens Functions" begin
    @test greensok()
    @test greensHok()
    @test greensEvsH()
end

@testset "Nonlinear Equations" begin
    @test nltest()
end

@testset "Details" begin
    @test precision_test()
    @test hlu_test()
    @test slashtest()
    @test mplu_test()
    @test mpglu_test()
    @test mpblu_test()
    @test AbsArray()
    @test static_test()
end

@testset "Krylov-IR" begin
    @test mpgmtest(1000)
    @test mpbctest(1000)
    @test hvse(128)
end

@testset "High Residual Precsion" begin
   @test hi_precision_res()
end
