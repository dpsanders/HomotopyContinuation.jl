# Solving general polynomial systems

The [`solve`](@ref) function is the most convenient way to solve general polynomial systems.
For the mathematical background take a look at our [How does it work?](https://www.juliahomotopycontinuation.org/guides/how-does-it-work/) guide.

```@docs
solve
```

## Result

A call to [`solve`](@ref) returns a [`Result`](@ref):
```@docs
Result
seed
```

In order to analyse a `Result` we provide the following helper functions
```@docs
results
mapresults
solutions
realsolutions
uniquesolutions
finite
Base.real(::HomotopyContinuation.Results)
atinfinity
singular
nonsingular
failed
multiplicities(::HomotopyContinuation.Results)
```

If you are interested in the number of solutions of a certain kind we
also provide the following helper functions.
```@docs
nresults
nfinite
nreal
nsingular
nnonsingular
natinfinity
nfailed
```

Also make sure to check the documentation for [`PathResult`](@ref).

## Estimate the complexity
We provide methods to compute the maximal number of solutions of polynomial systems.
```@docs
bezout_number
mixed_volume
```
