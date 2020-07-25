# ===============================================================
# Kinnosuke.jl : An elegant tool for scientific machine learning
# ===============================================================

module Kinnosuke

using Flux
using Plots
using FileIO
using JLD2

include("widget.jl")
include("train.jl")

end # module
