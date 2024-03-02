{ pkgs, inputs, ... }:
{
  imports =
  [ (import ./config) ] ++
  [ inputs.nixvim.homeManagerModules.nixvim ];
}

