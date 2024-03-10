"""
MPArray(AH::AbstractArray{Float64,2}; TF = Float32, onthefly=false)
Default constructor for MPArray. 

C. T. Kelley 2023

The MPArray data structure is

```
struct MPArray{TH<:AbstractFloat,TF<:AbstractFloat}
    AH::AbstractArray{TH,2}
    AL::AbstractArray{TF,2}
    residual::Vector{TH}
    onthefly::Bool
end
```
The constructor just builds an MPArray with TH=Float64. Set TF=Float16
to get double/half IR.


"""
function MPArray(AH::AbstractArray{Float64,2}; TF = Float32, onthefly=nothing)
    AL = TF.(AH)
# Default is interprecision on the fly if TF = Float32
    (onthefly==nothing) && (onthefly = (TF==Float16))
#    ((onthefly==nothing) && (TF==Float32)) && (onthefly=false)
#    ((onthefly==nothing) && (TF==Float16)) && (onthefly=true)
    (m,n)=size(AH); res=ones(eltype(AH),n)
    MPA = MPArray(AH, AL, res, onthefly) 
end
"""
MPArray(AH::AbstractArray{Float32,2}; TF = Float16, onthefly=true)
Default single precision constructor for MPArray with TF=Float16

If your high precision array is single, then your low precision
array is half (Duh!). 

We do the triangular
solves with on-the-fly interprecision transfer in this case because
the bit of extra accuracy makes a difference and, at least for now,
on-the-fly interprecision transfers are cheaper.

Data structures etc are the same as in the 
double-single/half case, but you don't have the option to go lower than
half.
"""
function MPArray(AH::AbstractArray{Float32,2}; TF = Float16, onthefly=true)
    AL = TF.(AH)
    (m,n)=size(AH); res=ones(eltype(AH),n)
    MPA = MPArray(AH, AL, res, onthefly)
end


