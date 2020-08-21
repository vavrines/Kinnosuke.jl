```
Adapt Zygote and Tracker modes

```
track(m) = fmap(x -> x isa AbstractArray ? Tracker.param(x) : x, m)


function device(isgpu, args...)
    if isgpu
        return gpu(args)
    else
        return cpu(args)
    end
end