struct PresolveResult{Vec<:AbstractVector, Var}
    result::Result{Vec}
    parameters::Vector{Var}
    generic_parameters::Vector{ComplexF64}
end

function presolve(F::MPPolys;
            parameters==throw(ArgumentError("You need to set `parameters=...` for presolve.")),
            generic_parameters=randn(ComplexF64, length(parameters)),
            kwargs...)
    F = MP.subs(F, Ref(parameters => generic_parameters))
    result = solve(F; kwargs...)
    PresolveResult(result, parameters, generic_parameters)
end
