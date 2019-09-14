{ pkgs ? import <nixpkgs> {}, ... }:
let requirements = with pkgs; [ python3 chez gnuplot wget ];
 in pkgs.mkShell { buildInputs = requirements; }
