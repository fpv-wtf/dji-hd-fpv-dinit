# DJI HD FPV dinit
Creates an ipk package for the `dinit` system compiled on the DJI HD FPV goggles.

Intended to be installed via `opkg` on a rooted set of DJI googles or air-unit.


## Starting
Run `dinit` in the background
```
dinit -q -u -d /opt/etc/dinit.d &
```

List running services:
```
dinitctl -u list
```

## Test service
A test service that will just sleep is included. It can be found in `/opt/etc/init.d/test`.

To start it, run:

```
dinitctl -u start test
dinitctl -u list
```

The output should now look like so:
```
> dinitctl -u list
[[+]     ] boot
[[+]     ] test (pid: 16592)
```

You can now kill the process and see how it is being restarted automatically:

```
> kill 16592
> dinitctl -u list
[[+]     ] boot
[[+]     ] test (pid: 16592)
```
