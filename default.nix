self: super:
{
  ginan = import ./ginan { pkgs = self; };
  rnxcmp = import ./rnxcmp { pkgs = self; };
}
