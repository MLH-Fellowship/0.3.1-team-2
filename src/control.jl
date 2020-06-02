
"""
_setBrightness(display, level)

sets the brightness of `display` to `level`. `level` should be 
between 0 to 1
Note: it doesn't changes the brightness through hardware

"""

function _setBrightness(display, level)
if display == "" || display == nothing
    error("display not provided")
elseif level <=0 || level >1.0
    throw(DomainError(level, "brightness should be in (0,1]"))
end
run(`xrandr --output $(display) --brightness $(level)`)
end

"""
_getDisplay()

Returns the primary display connected
# Examples
```julia-repl
julia> _getDisplay()
eDP-1
```
"""
function _getDisplay()
run(pipeline(`xrandr -q`,`grep " connected"`))
end