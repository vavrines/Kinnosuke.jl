```
Adapt Zygote and Tracker modes

```

track(m) = fmap(x -> x isa AbstractArray ? Tracker.param(x) : x, m)