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

### Start the service
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

### Stop the service
To stop the test service run:

```
dinitctl -u stop test
```

Listing the services will now show the test service to be disabled:
```
> dinitctl -u list
[[+]     ] boot
[     {-}] test
```

### Enabling a service
Enabling a service starts it immediately and makes it automatically start up when `dinit` is run. To permanently enable a service run:

```
dinitctl -u enable test
```

### Disabling a service
To no longer start a service when starting `dinit` simply run:

```
dinitctl -u enable test
```

## Custom Service
If you want to add a service you just need to place a file like `test` into `/opt/etc/dinit.d/`. Optimally you do this from your ipk file and then use the ipk `postinst` script to enable your service and the `prerm` to disable your service when the package is being removed.
