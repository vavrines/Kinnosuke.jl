```
Central difference

```
function central_diff(
    y::AbstractArray{<:AbstractFloat,1},
    x::AbstractArray{<:AbstractFloat,1},
)

    dy = zeros(eltype(y), axes(y))

    idx = eachindex(y) |> collect
    i0 = idx[1]
    i1 = idx[end]

    dy[i0] = (y[i0+1] - y[i0]) / (x[i0+1] - x[i0])
    dy[i1] = (y[i1] - y[i1-1]) / (x[i1] - x[i1-1])
    for i = i0+1:i1-1
        dy[i] = (y[i+1] - y[i-1]) / (x[i+1] - x[i-1])
    end

    return dy

end


function central_diff(y::AbstractArray{<:AbstractFloat,1}, dx::Real)
    x = ones(eltype(y), axes(y)) .* dx
    dy = central_diff(y, x)

    return dy
end


function central_diff!(
    dy::AbstractArray{<:AbstractFloat,1},
    y::AbstractArray{<:AbstractFloat,1},
    x::AbstractArray{<:AbstractFloat,1},
)

    @assert axes(dy) == axes(y) == axes(x)

    idx = eachindex(y) |> collect
    i0 = idx[1]
    i1 = idx[end]

    dy[i0] = (y[i0+1] - y[i0]) / (x[i0+1] - x[i0])
    dy[i1] = (y[i1] - y[i1-1]) / (x[i1] - x[i1-1])
    for i = i0+1:i1-1
        dy[i] = (y[i+1] - y[i-1]) / (x[i+1] - x[i-1])
    end

end


function central_diff!(
    dy::AbstractArray{<:AbstractFloat,1},
    y::AbstractArray{<:AbstractFloat,1},
    dx::Real,
)
    x = ones(eltype(y), axes(y)) .* dx
    central_diff!(dy, y, x)
end


```
Upwind difference

```
function upwind_diff(
    y::AbstractArray{<:Real,1},
    x::AbstractArray{<:Real,1};
    stream = :right::Symbol,
)

    dy = zeros(eltype(y), axes(y))

    idx = eachindex(y) |> collect
    i0 = idx[1]
    i1 = idx[end]

    if stream == :right
        dy[i0] = 0.0
        for i = i0+1:i1
            dy[i] = (y[i] - y[i-1]) / (x[i] - x[i-1])
        end
    elseif stream == :left
        dy[i1] = 0.0
        for i = i0:i1-1
            dy[i] = (y[i+1] - y[i]) / (x[i+1] - x[i])
        end
    else
        throw("streaming direction should be :left or :right")
    end

    return dy

end


function upwind_diff(y::AbstractArray{<:AbstractFloat,1}, dx::Real; stream = :right::Symbol)
    x = ones(eltype(y), axes(y)) .* dx
    dy = upwind_diff(y, x, stream = stream)

    return dy
end


function upwind_diff!(
    dy::AbstractArray{<:AbstractFloat,1},
    y::AbstractArray{<:AbstractFloat,1},
    x::AbstractArray{<:AbstractFloat,1};
    stream = :right::Symbol,
)

    @assert axes(dy) == axes(y) == axes(x)

    idx = eachindex(y) |> collect
    i0 = idx[1]
    i1 = idx[end]

    if stream == :right
        dy[i0] = 0.0
        for i = i0+1:i1
            dy[i] = (y[i] - y[i-1]) / (x[i] - x[i-1])
        end
    elseif stream == :left
        dy[i1] = 0.0
        for i = i0:i1-1
            dy[i] = (y[i+1] - y[i]) / (x[i+1] - x[i])
        end
    else
        throw("streaming direction should be :left or :right")
    end

    return dy

end


function upwind_diff!(
    dy::AbstractArray{<:AbstractFloat,1},
    y::AbstractArray{<:AbstractFloat,1},
    dx::Real;
    stream = :right::Symbol,
)
    x = ones(eltype(y), axes(y)) .* dx
    upwind_diff!(dy, y, x, stream = stream)
end
