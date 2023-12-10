# This file is MPBase.jl 
# Plain vanilla iterative refinement. The structures store
# High and low precision arrays and factorizations of these arrays
#
struct MPArray{TH<:AbstractFloat,TL<:AbstractFloat}
    AH::AbstractArray{TH,2}
    AL::AbstractArray{TL,2}
    residual::Vector{TH}
    onthefly::Bool
end

struct MPLFact{TH<:AbstractFloat,TL<:AbstractFloat,TF<:Factorization}
    AH::AbstractArray{TH,2}
    AL::AbstractArray{TL,2}
    AF::TF
    residual::Vector{TH}
    onthefly::Bool
end
