# HomotopyContinuation.jl [WIP]
[![Build Status](https://travis-ci.org/saschatimme/HomotopyContinuation.jl.svg?branch=master)](https://travis-ci.org/saschatimme/HomotopyContinuation.jl)
[![codecov](https://codecov.io/gh/saschatimme/HomotopyContinuation.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/saschatimme/HomotopyContinuation.jl)

This is a package for solving systems of polynomials via homotopy continuation.

Getting started
-----------
Since this package is pre-release and also relies on couple of unreleased packages. To satisfy all dependencies you have to install it via
```sh
Pkg.clone("https://github.com/blegat/MultivariatePolynomials.jl.git");
Pkg.clone("https://github.com/blegat/DynamicPolynomials.jl.git");
Pkg.clone("https://github.com/saschatimme/FixedPolySystem.jl");
Pkg.clone("git:://github.com/saschatimme/HomotopyContinuation.jl.git")
```

And here is a simple example:
```julia
using HomotopyContinuation
using DynamicPolynomials

@polyvar x
f = (x - 2.0) * (x - (2.5+ 4.0im))
g = (x - 4.3im) * (x + (2.1 - 4im))

H = StraightLineHomotopy([g], [f])

res = solve(H, [[-2.1 + 4.0im], [4.3im]], PredictorCorrector.Spherical())
```
