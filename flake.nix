{
    description = "django-runtime-options for Penn Labs";

    outputs =
    { nixpkgs, ... }:
    let
        pkgs = nixpkgs.legacyPackages.x86_64-linux;

        buildWithOverrides = buildPythonPackage: django:
            buildPythonPackage {
                pname = "django-runtime-options";
                version = "0.1.3";

                propagatedBuildInputs = [
                    django
                ];

                src = ./.;
            };
    in
    {
        packages.x86_64-linux.buildWithOverrides = buildWithOverrides;
        packages.x86_64-linux.default = buildWithOverrides pkgs.python3.pkgs.buildPythonPackage pkgs.python3.pkgs.django;
    };
}
