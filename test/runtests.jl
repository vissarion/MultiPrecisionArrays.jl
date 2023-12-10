using MultiPrecisionArrays
using MultiPrecisionArrays.Examples
using LinearAlgebra
using SIAMFANLEquations
using SIAMFANLEquations.TestProblems
using Test

include("Greens/gtest.jl")
include("NLTest/nltest.jl")
include("DetailsTest/precision_test.jl")
include("DetailsTest/hlu_test.jl")
include("DetailsTest/slashtest.jl")
include("DetailsTest/mplu_test.jl")
include("DetailsTest/AbsArray.jl")
include("GM-IRTest/mpgmtest.jl")
include("GM-IRTest/hvse.jl")

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
    @test AbsArray()
end

@testset "GM-IR" begin
    @test mpgmtest(1000)
    @test hvse(128)
end
