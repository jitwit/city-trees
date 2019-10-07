{ pkgs ? import ../nixpkgs {}, ... }:
let requirements = with pkgs; [ python3 chez chez-srfi gnuplot wget ];
 in pkgs.mkShell { buildInputs = requirements; }
