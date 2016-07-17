#### Fix Errors and get Running

Found this on the Elixir site that gives some helpful insight into the
short name vs long name differences.
```
In order to run distributed code, we need to start the VM with a name.
The name can be short (when in the same network) or long (requires the full computer address).
```

So if it indeed needs to be changed to long name in the scripts than it
may need to have the name actually updated.

If it still only needs the short name then more debugging is in order
to see why it does not like the short name originally in the script.
