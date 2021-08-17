# GNSS Pkgs

Nix packages for the following GNSS software:

* ginan
* rnxcmp
* anubis (TODO)
* gfzrnx (TODO)

# Requirements

Any Linux distribution or MacOS.

# Install Nix

1. Install the Nix package manager

```bash
curl -L https://nixos.org/nix/install | sh
```

Follow the instructions until you have the Nix package manager (v2.3) installed on
your system, then switch to Nix unstable (v2.4-pre).

```bash
nix-env -f '<nixpkgs>' -iA nixUnstable
```

2. Enable experimental features

```bash
mkdir -p ~/.config/nix
echo 'experimental-features = nix-command flakes' >> ~/.config/nix/nix.conf
```

3. Register https://github.com/GeoscienceAustralia/gnss-pkgs as a Nix Flake

```bash
nix registry add flake:gnss-pkgs github:geoscienceaustralia/gnss-pkgs
```

# Install Software 

This step requires you to have `git` installed.

```bash
nix profile install gnss-pkgs#ginan
# nix profile install gnss-pkgs#rnxcmp
# etc.
```

```
pea
PEA starting... ( v from )
Options:
  --help                      Help
  --quiet                     Less output
  --verbose                   More output
  --very-verbose              Much more output
  --config arg                Configuration file
  --trace_level arg           Trace level
  --antenna arg               ANTEX file
  --navigation arg            Navigation file
  --sinex arg                 SINEX file
  --sp3files arg              Orbit (SP3) file
  --clkfiles arg              Clock (CLK) file
  --dcbfiles arg              Code Bias (DCB) file
  --bsxfiles arg              Bias Sinex (BSX) file
  --ionfiles arg              Ionosphere (IONEX) file
  --podfiles arg              Orbits (POD) file
  --blqfiles arg              BLQ (Ocean loading) file
  --erpfiles arg              ERP file
  --elevation_mask arg        Elevation Mask
  --max_epochs arg            Maximum Epochs
  --epoch_interval arg        Epoch Interval
  --rnx arg                   RINEX station file
  --root_input_dir arg        Directory containg the input data
  --root_output_directory arg Output directory
  --start_epoch arg           Start date/time
  --end_epoch arg             Stop date/time
  --run_rts_only arg          RTS filename (without _xxxxx suffix)
  --dump-config-only          Dump the configuration and exit
  --input_persistance         Begin with previously stored filter and
                              navigation states
  --output_persistance        Store filter and navigation states for restarting
PEA finished
```
