# ExtendedPetriNets
Free library to model Petri nets and state transition diagrams (extended version).

## Library description

This library is an extended version of the petri net library of the [ModelicaAdditions](https://github.com/modelica-deprecated/ModelicaAdditions) library.

The [ModelicaAdditions](https://github.com/modelica-deprecated/ModelicaAdditions) contains a sub-library PetriNet for modeling of discrete phenomena with Petri net formalism. It is designed for, and implements, black deterministic priority Petri nets, which are well suited e.g., for control system specification but can have rather limited expressiveness in other problem domains. Such may be in reliability engineering or in investigation of socio-technical aspects of complex technical systems.

Therefore, the Petri net library already available is extended to form a new library ExtendedPetriNet with
 1. transitions allowing for deterministic or stochastic time delays before their firing (using builit-in random number generators BIRNG or custom made ones),
 2. and places capable of containing more than one token, such that timed, stochastic Petri nets can be modeled.

Several modeling and simulation examples are given to demonstrate the usability of the enhancements - among them - queuing models and models to determine system availability, see the adjoned [Petri_Net_Extensions.pdf](../../blob/release/ExtendedPetriNets 1.0/Petri_Net_Extensions.pdf?raw=true).

For the time being, the extended library is currently structured in a manner that all extensions are clearly seperated from the original Petri net library. Three sub-packages have been added:
 1. Extensions
 2. Modules
 3. ExamplesExtendedPetriNets.

At a later time, the additions could be fully integrated if desired.

## Current release

Download [ExtendedPetriNets v1.0 (2002-04-11)](../../archive/v1.0.zip)


## License

Copyright &copy; 2001,  S. Fabricius, ETH Zurich, Switzerland

This Modelica package is free software and the use is completely at your own risk;
it can be redistributed and/or modified under the terms of the [Modelica License 2](http://www.modelica.org/licenses/ModelicaLicense2).
For license conditions (including the disclaimer of warranty) visit [http://www.modelica.org/licenses/ModelicaLicense2](http://www.modelica.org/licenses/ModelicaLicense2).


## Development and contribution
Author:

    Stefan Fabricius
    Swiss Federal Institute of Technology (ETH)
    Laboratory for Safety Analysis
	Weinbergstrasse 11
	8001 Zurich
	Switzerland
	email: fabricius@lsa.iet.mavt.ethz.ch
