export FixedPatch

"""
    FixedPatch()
"""
struct FixedPatch <: AbstractAffinePatch end

struct FixedPatchState{T, N} <: AbstractAffinePatchState{N}
    v̄::PVector{T, N} # this is already conjugated
end

function state(::FixedPatch, x::PVector)
    v = copy(x)
    conj!(v.data)
    FixedPatchState(v)
end

function setup!(state::FixedPatchState, x::AbstractVector)
    @boundscheck length(x) == length(state.v̄)
    LinearAlgebra.normalize!(x)
    @inbounds for i in eachindex(state.v̄)
        state.v̄[i] = conj(x[i])
    end
    state
end

onpatch!(x::AbstractVector, state::FixedPatchState) = onpatch!(x, state.v̄)
evaluate!(u, state::FixedPatchState, x::PVector) = evaluate_patch!(u, state.v̄, x)
jacobian!(U, state::FixedPatchState, x::PVector) = jacobian_patch!(U, state.v̄, x)
