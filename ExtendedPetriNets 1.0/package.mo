package ExtendedPetriNets
  "Library to model timed, stochastic Petri nets and state transition diagrams, extended version."

  extends Modelica.Icons.Library;

  annotation (
    Coordsys(
      extent=[0, 0; 779, 465],
      grid=[1, 1],
      component=[20, 20]),
    Documentation(info="
<HTML>

<p>
The standard Modelica library contains a sub-library <b><i>PetriNet</i></b>
for modeling of discrete phenomena with Petri net formalism. It is designed for, and
implements, black deterministic priority Petri nets, which are well suited e.g.,
for control system specification but can have rather limited expressiveness
in other problem domains.  Such may be in reliability engineering or in
investigation of socio-technical aspects of complex technical systems.
</p>

<p>
Therefore, the Petri net library already available is extended to form a
new library <b><i>ExtendedPetriNet</i></b> with

<ol>
<li>transitions allowing for deterministic or stochastic time delays before their firing
    (using builit-in random number generators BIRNG or custom made ones), and </li>

<li>places capable of containing more than one token, </li>
</ol>

such that timed, stochastic Petri nets can be modeled.
</p>

<p>
Several modeling and simulation examples are given to demonstrate the usability of the
enhancements - among them - queuing models and models to determine system availability,
see the adjoned *.pdf document <b><a href=\"../Petri_Net_Extensions.pdf\">
Petri_Net_Extensions</a></b>.
</p>

<p>
For the time being, the extended library is currently structured in a manner
that all extensions are
clearly seperated from the original Petri net library.
Three sub-packages have been added:

<ol>
<li>Extensions</li>
<li>Modules</li>
<li>ExamplesExtendedPetriNets.</li>
</ol>

At a later time, the additions could be fully integrated if desired.
</p>


<dl>
<dt><b>Author:</b>
<dd><a href=\"http://www.lsa.ethz.ch/lsa/faculty/docstu/fabricius/index.html
\">Stefan Fabricius</a><br>
    Swiss Federal Institute of Technology (ETH)<br>
    Laboratory for Safety Analysis<br>
    Weinbergstrasse 11<br>
    8001 Zurich<br>
    Switzerland<br>
    email: <A HREF=\"mailto:fabricius@lsa.iet.mavt.ethz.ch\">fabricius@lsa.iet.mavt.ethz.ch</A><br>
</dl>
<br>

<p><b>Release History and Notes:</b></p>
<ul>
<li><i>April 11th, 2002</i>, Version 1.0<br> </li>
</ul>
<br>

<p><b>Copyright (C) 2002, with the author.</b></p>

<p>
The <b><i>ExtendedPetriNet</i></b> library is <b>free</b> software;  it can be redistributed and/or modified
under the terms of the <a href=\"../ModelicaLicense.html\">Modelica license</a>, see the license conditions in the documentation
to Modelica.
</p>

<p>
The library comes with absolutely no warranty.  It has been carefully tested, yet, the absence
of faults or bugs cannot be guaranteed.
</p>

<p>
Comments or bug reports are most welcome.
</p>

<p>
<hr>
Below listed is the information to the orginal, not extended <b><i>PetriNet</i></b> library.
<hr>
</p>

<p>
The <b>PetriNets</b> library allows to model <b>discrete</b> components by
a special kind of <b>Petri nets</b> with at most one token on a place,
as well as by <b>state transition diagrams</b>
(which are special kinds of Petri nets). Petri nets
and state transition diagrams are \"higher level\" constructs for the description of
switching elements, parallel activities or syncronization. For several kinds
of applications it is much easier and clearer to use these components instead
of modeling the discrete behaviour directly with the basic language constructs
of Modelica (\"if\" or \"when\" statements). A typical Petri net is shown
in the following figure:
</p>

<IMG SRC=\"PetriNet1.gif\" ALT=\"Petri net\">

<p>
A <b>Petri net</b> is defined in the following way:
</p>

<ol>
<li>It consists of a set of <b>places</b> and of a set of <b>transitions</b>.
    The places are split into start places which are \"active\" at the start
    of the simulation and of \"normal\" places which are \"non-active\" at the
    beginning. </li>

<li>Places are connected by <b>transitions</b>, whereby no places and no
    transitions are directly connected (i.e., a place is connected to a
    transition which in turn is connected to another place).
    Any number of start places can be present. </li>

<li>An \"<b>active</b>\" place is characterized by a \"<b>token</b>\"
    placed on the place. In the ModelicaAdditions.PetriNets libray a place
    is \"active\" when the public variable \"<b>state</b>\" of the place
    is <b>true</b>.</li>

<li>There are <b>several transition</b> elements in the library. Whenever the
    <b>states</b> of <b>all inputs</b> to the transition elements are <b>active</b>
    and when the <b>condition</b> of the transition is <b>true</b> then the
    following actions are performed:
    <ul>
    <li>all <b>input states</b> are marked as \"<b>inactive</b>\", i.e.,
        the token is removed.</li>
    <li>all <b>output states</b> are marked as \"<b>active</b>\", i.e.,
        they are marked by new tokens.</li>
    </ul>
    The <b>conditionPort</b> connector of a transition element is used
    to signal via a Boolean signal whether the condition of a transition is
    true or false. Alternatively, the condition can be provided as an
    equation to set the public variable <b>condition</b> of the
    corresponding transition element.</li>

<li>There are several <b>place</b> components in this library
    (such as Place01, Place10, Place11) which have
    different number of input and output transition connectors.
    This is due to the current limitations of the annotations of
    Modelica, which do not allow to define the graphical location of
    the elements of a vector of (transition) connectors with unknown length.
    </li>

<li>If two or more transitions of a place would fire at the same time
    instant, <b>priorities</b> are used in order that exactly one of them fires.
    The highest priority has a transition connector of a place with the
    lowest index (e.g. outTransition1 has a higher priority as
    outTransition2).
</ol>

<p>
The method used in this library to realize Petri nets in Modelica
is described in detail in:
</p>

<dl>
<dt>Mosterman P.J., Otter M. and Elmqvist H. (1998):
<dd><b>Modeling Petri-Nets as Local Constraint Equations
    for Hybrid Systems using Modelica.</b>
    1998 Summer Computer Simulation Conference (SCSC'98),
    Reno, U.S.A., 19.-20. Juli (download from
    <a href=\"http://www.Modelica.org/papers/scsc98fp.pdf\">here</a>).
</dl>

<p>
This package is not part of the Modelica standard library, because it is
planned to realize a package with only <b>one</b> place and <b>one</b>
transition component, once vector connectors with unknown length have better
support in Modelica.
</p>

<dl>
<dt><b>Main Author:</b>
<dd><a href=\"http://www.op.dlr.de/~otter/\">Martin Otter</a><br>
    Deutsches Zentrum f&uuml;r Luft und Raumfahrt e.V. (DLR)<br>
    Institut f&uuml;r Robotik und Mechatronik<br>
    Postfach 1116<br>
    D-82230 Wessling<br>
    Germany<br>
    email: <A HREF=\"mailto:Martin.Otter@dlr.de\">Martin.Otter@dlr.de</A><br>
</dl>
<br>

<p><b>Release Notes:</b></p>
<ul>
<li><i>June 12, 2000</i>
       by <a href=\"http://www.op.dlr.de/~otter/\">Martin Otter</a>:<br>
       Realized.</li>
</ul>
<br>

<p><b>Copyright (C) 2000, DLR.</b></p>

<p><i>
The ModelicaAdditions.PetriNets package is <b>free</b> software;
it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package
Modelica in file \"Modelica/package.mo\".
</i></p>

<br>
The extensions to the original are not specifically internally documented at this time.
Copyright for extensions with S. Fabricius, ETH Zurich, Switzerland, December 20th, 2001.


</HTML>
"),
    Window(
      x=0.32,
      y=0.09,
      width=0.62,
      height=0.5,
      library=1,
      autolayout=1));
  package Interfaces
    extends Modelica.Icons.Library;

    connector FirePort
      Boolean state "State of connected place";
      Boolean fire "True, if transition fires";
    end FirePort;
    connector SetPort
      Boolean state "State of connected place";
      Boolean set "True, if transition fires";
    end SetPort;
    connector FirePortIn "FirePort with input icon"
      extends FirePort;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Icon(Polygon(points=[-100, 100; 100, 0; -100, -100; -100, 100], style(
                color=41, fillColor=41))),
        Diagram(Polygon(points=[-100, 100; 100, 0; -100, -100; -100, 100],
              style(color=41, fillColor=41)), Text(
            extent=[-100, -120; 100, -220],
            string="%name",
            style(color=0))),
        Window(
          x=0.39,
          y=0.19,
          width=0.6,
          height=0.6));
    end FirePortIn;
    connector SetPortIn "SetPort with input icon"
      extends SetPort;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Icon(Polygon(points=[-100, 100; 100, 0; -100, -100; -100, 100], style(
                color=45, fillColor=41))),
        Diagram(Polygon(points=[-100, 100; 100, 0; -100, -100; -100, 100],
              style(color=41, fillColor=41)), Text(
            extent=[-100, -120; 100, -220],
            string="%name",
            style(color=0))),
        Window(
          x=0.24,
          y=0.24,
          width=0.6,
          height=0.6));
    end SetPortIn;
    connector FirePortOut "FirePort with output icon"
      extends FirePort;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Icon(Polygon(points=[-100, 100; 100, 0; -100, -100; -100, 100], style(
                color=41, fillColor=7))),
        Diagram(Polygon(points=[-100, 100; 100, 0; -100, -100; -100, 100],
              style(color=41, fillColor=7)), Text(
            extent=[-100, -120; 100, -220],
            string="%name",
            style(color=0))),
        Window(
          x=0.27,
          y=0.11,
          width=0.6,
          height=0.6));
    end FirePortOut;
    connector SetPortOut "SetPort with output icon"
      extends SetPort;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Icon(Polygon(points=[-100, 100; 100, 0; -100, -100; -100, 100], style(
                color=41, fillColor=7))),
        Diagram(Polygon(points=[-100, 100; 100, 0; -100, -100; -100, 100],
              style(color=41, fillColor=7)), Text(
            extent=[-100, -120; 100, -220],
            string="%name",
            style(color=0))),
        Window(
          x=0.33,
          y=0.17,
          width=0.6,
          height=0.6));
    end SetPortOut;
    annotation (Coordsys(
        extent=[0, 0; 338, 282],
        grid=[1, 1],
        component=[20, 20]), Window(
        x=0.08,
        y=0.09,
        width=0.34,
        height=0.44,
        library=1,
        autolayout=1));
  end Interfaces;
  package Examples
    extends Modelica.Icons.Library;

    model Parallel
      "Example to demonstrate parallel activities described by a petri net  "
      extends Modelica.Icons.Example;
      output Boolean S1state;
      output Boolean P1state;
      output Boolean P2state;
      output Boolean P3state;
      output Boolean P4state;
      output Boolean P5state;
      output Boolean P6state;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[1, 1],
          component=[20, 20]),
        Window(
          x=0.15,
          y=0.02,
          width=0.65,
          height=0.8),
        Documentation(info="<HTML>
<p>
This is an example to demonstrate in which way <b>parallel</b> activities
can be modelled by a Petri net. When transition \"Par1\" fires
(after 1 second), two branches are executed in parallel.
After 6 seconds the two branches are synchronized in order to arrive
at place \"P6\".
</p>

<p>
Before simulating the model, try to figure out whether branch
P2-P3-P5 or branch P2-P4-P5 is executed.
</p>

<p>Simulate for 7 seconds and plot the following variables:
</p>

<pre>
  S1state, P1state, P2state, ..., P6state
</pre>

</HTML>
"));
      PetriNets.Place01 S1(initialState=true) annotation (extent=[-60, 80; -40
            , 100], rotation=-90);
      PetriNets.Place11 P1 annotation (extent=[-60, -10; -40, 10], rotation=-90
        );
      PetriNets.Parallel Par1(condLabel="time>1") annotation (extent=[-60, 50;
            -40, 70], rotation=-90);
      PetriNets.Place12 P2 annotation (extent=[20, 50; 40, 70], rotation=-90);
      PetriNets.Transition T1(condLabel="time>2") annotation (extent=[-20, 20;
            0, 40], rotation=-90);
      PetriNets.Transition T2(condLabel="time>3") annotation (extent=[60, 20;
            80, 40], rotation=-90);
      PetriNets.Place11 P3 annotation (extent=[-20, -10; 0, 10], rotation=-90);
      PetriNets.Transition T3(condLabel="time>4") annotation (extent=[-20, -36
            ; 0, -16], rotation=-90);
      PetriNets.Place11 P4 annotation (extent=[60, -10; 80, 10], rotation=-90);
      PetriNets.Transition T4(condLabel="time>5") annotation (extent=[60, -36;
            80, -16], rotation=-90);
      PetriNets.Place21 P5 annotation (extent=[20, -70; 40, -50], rotation=-90)
        ;
      PetriNets.Synchronize Sync1(condLabel="time>6") annotation (extent=[-60,
            -76; -40, -56], rotation=-90);
      PetriNets.Place10 P6 annotation (extent=[-60, -100; -40, -80], rotation=
            270);
    equation
      connect(Par1.outTransition1, P1.inTransition) annotation (
          points=[-50, 55; -50, 12], style(color=41));
      connect(T1.outTransition, P3.inTransition) annotation (points=[-10, 25; -
            10, 12], style(color=41));
      connect(P3.outTransition, T3.inTransition) annotation (points=[-10, -11;
            -10.05, -19.95], style(color=41));
      connect(P1.outTransition, Sync1.inTransition1) annotation (points=[-50, -
            11; -50, -60], style(color=41));
      connect(Sync1.outTransition, P6.inTransition) annotation (points=[-50, -
            71; -50, -78], style(color=41));
      connect(T2.outTransition, P4.inTransition) annotation (points=[70, 25; 70
            , 12], style(color=41));
      connect(P4.outTransition, T4.inTransition) annotation (points=[70, -11;
            69.95, -19.95], style(color=41));
      connect(S1.outTransition, Par1.inTransition) annotation (points=[-50.2,
            79; -50.05, 66.05], style(color=41));
      connect(T3.outTransition, P5.inTransition1) annotation (points=[-10, -31
            ; -10, -37; 24, -37; 24, -48], style(color=41));
      connect(T4.outTransition, P5.inTransition2) annotation (points=[70, -31;
            70, -37; 36, -37; 36, -48], style(color=41));
      connect(P2.outTransition2, T2.inTransition) annotation (points=[36, 48.9
            ; 36, 45; 69.95, 45; 69.95, 36.05], style(color=41));
      connect(Par1.outTransition2, P2.inTransition) annotation (points=[-44, 55
            ; -44, 50; -25, 50; -25, 90; 30, 90; 30, 72], style(color=41));
      connect(P5.outTransition, Sync1.inTransition2) annotation (points=[30, -
            71; 30, -90; 0, -90; 0, -51; -44, -51; -44, -60], style(color=41));
      connect(P2.outTransition1, T1.inTransition) annotation (points=[24, 49;
            24, 44; -10.05, 44; -10.05, 36.05], style(color=41));
      Par1.condition = time > 1;
      T1.condition = time > 2;
      T2.condition = time > 3;
      T3.condition = time > 4;
      T4.condition = time > 5;
      Sync1.condition = time > 6;

      /*output variables*/
      S1state = S1.state;
      P1state = P1.state;
      P2state = P2.state;
      P3state = P3.state;
      P4state = P4.state;
      P5state = P5.state;
      P6state = P6.state;
    end Parallel;
    annotation (Coordsys(
        extent=[0, 0; 445, 311],
        grid=[1, 1],
        component=[20, 20]), Window(
        x=0.45,
        y=0.01,
        width=0.35,
        height=0.35,
        library=1,
        autolayout=1));
  end Examples;
  model Place01 "Place with one output transition"
    parameter Boolean initialState=false "Initial value of state";
    Boolean state(final start=initialState) "State of place";
  protected
    Boolean newState(final start=initialState);
  public
    PetriNets.Interfaces.FirePortOut outTransition annotation (extent=[100, -12
          ; 120, 8]);
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Window(
        x=0.25,
        y=0,
        width=0.49,
        height=0.65),
      Icon(Ellipse(extent=[-100, -100; 100, 100], style(color=41, fillColor=7))
          , Text(extent=[0, 99; 0, 159], string="%name")),
      Diagram(Ellipse(extent=[-100, -100; 100, 100], style(color=41, fillColor=
                7))));
  equation
    // Set new state for next iteration
    state = pre(newState);
    newState = state and not outTransition.fire;

    // Report state to output transition
    outTransition.state = state;
  end Place01;
  model Place10 "Place with one input transition"
    parameter Boolean initialState=false "Initial value of state";
    Boolean state(final start=initialState) "State of place";
  protected
    Boolean newState(final start=initialState);
  public
    PetriNets.Interfaces.SetPortIn inTransition annotation (extent=[-140, -20;
          -100, 20]);
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Window(
        x=0.16,
        y=0.03,
        width=0.49,
        height=0.61),
      Icon(Ellipse(extent=[-100, -100; 100, 100], style(color=41, fillColor=7))
          , Text(extent=[0, 99; 0, 159], string="%name")),
      Diagram(Ellipse(extent=[-100, -100; 100, 100], style(color=41))));
  equation
    // Set new state for next iteration
    state = pre(newState);
    newState = inTransition.set or state;

    // Report state to input transition
    inTransition.state = state;
  end Place10;
  model Place11 "Place with one input and one output transition"
    parameter Boolean initialState=false "Initial value of state";
    Boolean state(final start=initialState) "State of place";
  protected
    Boolean newState(final start=initialState);
  public
    PetriNets.Interfaces.SetPortIn inTransition annotation (extent=[-140, -20;
          -100, 20]);
    PetriNets.Interfaces.FirePortOut outTransition annotation (extent=[100, -10
          ; 120, 10]);
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Window(
        x=0.16,
        y=0.05,
        width=0.5,
        height=0.7),
      Icon(Ellipse(extent=[-100, -100; 100, 100], style(color=41, fillColor=7))
          , Text(extent=[0, 99; 0, 159], string="%name")),
      Diagram(Ellipse(extent=[-100, -100; 100, 100], style(color=41))));
  equation
    // Set new state for next iteration
    state = pre(newState);
    newState = inTransition.set or state and not outTransition.fire;

    // Report state to input and output transitions
    inTransition.state = state;
    outTransition.state = state;
  end Place11;
  model Place21 "Place with two input and one output transition"
    parameter Boolean initialState=false "Initial value of state";
    Boolean state(final start=initialState) "State of place";
  protected
    Boolean newState(final start=initialState);
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Window(
        x=0.11,
        y=0,
        width=0.49,
        height=0.71),
      Icon(
        Ellipse(extent=[-100, -100; 100, 100], style(color=41, fillColor=7)),
        Line(points=[-100, 60; -80, 60], style(color=41)),
        Line(points=[-100, -60; -80, -60], style(color=41)),
        Text(extent=[0, 99; 0, 159], string="%name")),
      Diagram(
        Ellipse(extent=[-100, -100; 100, 100], style(color=41)),
        Line(points=[-100, 60; -80, 60], style(color=41)),
        Line(points=[-100, -60; -80, -60], style(color=41))));
  public
    PetriNets.Interfaces.FirePortOut outTransition annotation (extent=[100, -10
          ; 120, 10]);
    PetriNets.Interfaces.SetPortIn inTransition1 annotation (extent=[-140, -80
          ; -100, -40]);
    PetriNets.Interfaces.SetPortIn inTransition2 annotation (extent=[-140, 80;
          -100, 40]);
  equation
    // Set new state for next iteration
    state = pre(newState);
    newState = inTransition1.set or inTransition2.set or state and not
      outTransition.fire;

    // Report state to input and output transitions
    inTransition1.state = state;
    inTransition2.state = inTransition1.state or inTransition1.set;
    outTransition.state = state;
  end Place21;
  model Place12 "Place with one input and two output transitions"
    parameter Boolean initialState=false "Initial value of state";
    Boolean state(final start=initialState) "State of place";
  protected
    Boolean newState(final start=initialState);
  public
    PetriNets.Interfaces.SetPortIn inTransition annotation (extent=[-140, -20;
          -100, 20]);
    PetriNets.Interfaces.FirePortOut outTransition1 annotation (extent=[100, -
          70; 120, -50]);
    PetriNets.Interfaces.FirePortOut outTransition2 annotation (extent=[100, 70
          ; 122, 50]);
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Window(
        x=0.16,
        y=0.03,
        width=0.44,
        height=0.64),
      Icon(
        Ellipse(extent=[-100, -100; 100, 100], style(color=41, fillColor=7)),
        Line(points=[100, 60; 80, 60], style(color=41)),
        Line(points=[102, -60; 82, -60], style(color=41)),
        Text(extent=[0, 99; 0, 159], string="%name")),
      Diagram(
        Ellipse(extent=[-100, -100; 100, 100], style(color=41)),
        Line(points=[100, 60; 80, 60], style(color=41)),
        Line(points=[100, -60; 80, -60], style(color=41))));
  equation
    // Set new state for next iteration
    state = pre(newState);
    newState = inTransition.set or state and not (outTransition1.fire or
      outTransition2.fire);

    // Report state to input and output transitions
    inTransition.state = state;
    outTransition1.state = state;
    outTransition2.state = outTransition1.state and not outTransition1.fire;
  end Place12;
  model Place22 "Place with two input and two output transitions"
    parameter Boolean initialState=false "Initial value of state";
    Boolean state(final start=initialState) "State of place";
  protected
    Boolean newState(final start=initialState);
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Window(
        x=0.21,
        y=0.03,
        width=0.52,
        height=0.7),
      Icon(
        Ellipse(extent=[-100, -100; 100, 100], style(color=41, fillColor=7)),
        Line(points=[-100, 60; -80, 60], style(color=41)),
        Line(points=[-100, -60; -80, -60], style(color=41)),
        Line(points=[80, -60; 100, -60], style(color=41)),
        Line(points=[82, 60; 102, 60], style(color=41)),
        Text(extent=[0, 99; 0, 159], string="%name")),
      Diagram(
        Ellipse(extent=[-100, -100; 100, 100], style(color=41)),
        Line(points=[-100, 60; -80, 60], style(color=41)),
        Line(points=[-100, -60; -80, -60], style(color=41)),
        Line(points=[80, 60; 100, 60], style(color=41)),
        Line(points=[80, -60; 100, -60], style(color=41))));
  public
    PetriNets.Interfaces.FirePortOut outTransition1 annotation (extent=[100, -
          70; 120, -50]);
    PetriNets.Interfaces.FirePortOut outTransition2 annotation (extent=[100, 70
          ; 120, 50]);
    PetriNets.Interfaces.SetPortIn inTransition1 annotation (extent=[-140, -80
          ; -100, -40]);
    PetriNets.Interfaces.SetPortIn inTransition2 annotation (extent=[-140, 80;
          -100, 40]);
  equation
    // Set new state for next iteration
    state = pre(newState);
    newState = inTransition1.set or inTransition2.set or state and not (
      outTransition1.fire or outTransition2.fire);

    // Report state to input and output transitions
    inTransition1.state = state;
    inTransition2.state = inTransition1.state or inTransition1.set;
    outTransition1.state = state;
    outTransition2.state = outTransition1.state and not outTransition1.fire;
  end Place22;
  model Transition "Transition with one input and one output connection"
    parameter String condLabel=" " "Condition as string (e.g. \"x > 0\")";
    Boolean condition;
    Boolean fire;
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.26,
        y=0.01,
        width=0.42,
        height=0.78),
      Icon(
        Rectangle(extent=[-5, 80; 5, -80], style(
            color=41,
            fillColor=41,
            fillPattern=1)),
        Line(points=[-40, 0; -5, 0], style(color=41)),
        Line(points=[40, 0; 5, 0], style(color=41)),
        Text(
          extent=[0, -120; 0, -170],
          string="%condLabel",
          style(color=0)),
        Text(extent=[0, 90; 0, 150], string="%name")),
      Diagram(
        Rectangle(extent=[-5, 80; 5, -80], style(
            color=41,
            fillColor=41,
            fillPattern=1)),
        Line(points=[-38, 0; -5, 0], style(color=41)),
        Line(points=[40, 0; 5, 0], style(color=41)),
        Text(extent=[-112, -120; 128, -100], string="%condLabel")));
    PetriNets.Interfaces.FirePortIn inTransition annotation (extent=[-81, -21;
          -40, 20]);
    PetriNets.Interfaces.SetPortOut outTransition annotation (extent=[40, -10;
          60, 10]);
    Modelica.Blocks.Interfaces.BooleanInPort conditionPort(final n=1)
      annotation (extent=[-20, -120; 20, -80], rotation=90);
  equation
    condition = conditionPort.signal[1];
    fire = condition and inTransition.state and not outTransition.state;
    inTransition.fire = fire;
    outTransition.set = fire;
  end Transition;
  model Parallel "Transition with one input and two output connections"
    parameter String condLabel=" " "Condition as string (e.g. \"x > 0\")";
    Boolean fire;
    Boolean condition;
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.1,
        y=0.02,
        width=0.61,
        height=0.73),
      Icon(
        Rectangle(extent=[-5, 80; 5, -80], style(
            color=41,
            fillColor=41,
            fillPattern=1)),
        Line(points=[-40, 0; -5, 0], style(color=41)),
        Line(points=[40, 60; 5, 60], style(color=41)),
        Text(extent=[0, 89; 0, 149], string="%name"),
        Text(
          extent=[0, -120; 0, -170],
          string="%condLabel",
          style(color=0)),
        Line(points=[40, 0; 5, 0], style(color=41))),
      Diagram(
        Rectangle(extent=[-5, 80; 5, -80], style(
            color=41,
            fillColor=41,
            fillPattern=1)),
        Line(points=[-38, 0; -5, 0], style(color=41)),
        Line(points=[40, 0; 5, 0], style(color=41)),
        Text(extent=[-112, -120; 128, -100], string="%condLabel"),
        Line(points=[40, 60; 5, 60], style(color=41))));
    PetriNets.Interfaces.FirePortIn inTransition annotation (extent=[-81, -21;
          -40, 20]);
    PetriNets.Interfaces.SetPortOut outTransition1 annotation (extent=[40, -10
          ; 60, 10]);
    PetriNets.Interfaces.SetPortOut outTransition2 annotation (extent=[40, 50;
          60, 70]);
    Modelica.Blocks.Interfaces.BooleanInPort conditionPort(final n=1)
      annotation (extent=[-20, -120; 20, -80], rotation=90);
  equation
    condition = conditionPort.signal[1];
    fire = condition and inTransition.state and not (outTransition1.state or
      outTransition2.state);
    inTransition.fire = fire;
    outTransition1.set = fire;
    outTransition2.set = fire;
  end Parallel;
  model Synchronize "Transition with two input and one output connections"
    parameter String condLabel=" " "Condition as string (e.g. \"x > 0\")";
    Boolean condition;
    Boolean fire;
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Window(
        x=0.45,
        y=0.16,
        width=0.35,
        height=0.49),
      Icon(
        Rectangle(extent=[-5, 80; 5, -80], style(
            color=41,
            fillColor=41,
            fillPattern=1)),
        Line(points=[-40, 0; -5, 0], style(color=41)),
        Line(points=[40, 0; 5, 0], style(color=41)),
        Text(
          extent=[0, -120; 0, -170],
          string="%condLabel",
          style(color=0)),
        Line(points=[-40, 60; -5, 60], style(color=41)),
        Text(extent=[0, 89; 0, 149], string="%name")),
      Diagram(
        Rectangle(extent=[-5, 80; 5, -80], style(
            color=41,
            fillColor=41,
            fillPattern=1)),
        Line(points=[-38, 0; -1, 0], style(color=41)),
        Line(points=[40, 0; 5, 0], style(color=41)),
        Line(points=[-40, 60; -3, 60], style(color=41)),
        Text(extent=[-112, -120; 128, -100], string="%condLabel")));
    PetriNets.Interfaces.FirePortIn inTransition1 annotation (extent=[-80, -20
          ; -40, 20]);
    PetriNets.Interfaces.FirePortIn inTransition2 annotation (extent=[-80, 80;
          -40, 40]);
    PetriNets.Interfaces.SetPortOut outTransition annotation (extent=[40, -10;
          60, 10]);
    Modelica.Blocks.Interfaces.BooleanInPort conditionPort(final n=1)
      annotation (extent=[-20, -120; 20, -80], rotation=90);
  equation
    condition = conditionPort.signal[1];
    fire = condition and inTransition1.state and inTransition2.state and not
      outTransition.state;
    inTransition1.fire = fire;
    inTransition2.fire = fire;
    outTransition.set = fire;
  end Synchronize;
  package Modules
    extends Modelica.Icons.Library2;
    annotation (Coordsys(
        extent=[0, 0; 466, 466],
        grid=[1, 1],
        component=[20, 20]), Window(
        x=0.02,
        y=0.42,
        width=0.37,
        height=0.5,
        library=1,
        autolayout=1));
    model SingleComponent
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram,
        Icon(Rectangle(extent=[-80, 80; 80, -80], style(color=0, fillColor=49))
            , Text(extent=[0, -76; 0, -108], string="%name")),
        Window(
          x=0.42,
          y=0.01,
          width=0.39,
          height=0.87));
      Modelica.Blocks.Interfaces.BooleanOutPort BFunctional annotation (extent=
            [-10, 80; 10, 100], rotation=90);
      Extensions.TDelayExp DelayLifeExp(mean=9, seed=2354) annotation (extent=[
            20, 8; 40, 28], rotation=-90);
      Place11 Nonfunctional annotation (extent=[10, -20; -10, 0]);
      Extensions.TDelayExp DelayRepairExp(mean=1, seed=984446) annotation (
          extent=[-40, 28; -20, 8], rotation=-90);
      Place11 Functional(initialState=true) annotation (extent=[-10, 40; 10, 60
            ]);
    equation
      connect(DelayLifeExp.outTransition, Nonfunctional.
        inTransition) annotation (points=[30, 13; 14, -10]);
      connect(Nonfunctional.outTransition, DelayRepairExp.inTransition)
        annotation (points=[-10, -10; -30, 12]);
      connect(Functional.outTransition, DelayLifeExp.inTransition) annotation (
          points=[12, 50; 30, 24.05]);
      connect(Functional.inTransition, DelayRepairExp.outTransition)
        annotation (points=[-14, 50; -30, 23]);
      BFunctional.signal[1] = Functional.state;
    end SingleComponent;
    model SingleComponentAlt
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram,
        Icon(Rectangle(extent=[-80, 80; 80, -80], style(color=0, fillColor=49))
            , Text(extent=[0, -76; 0, -108], string="%name")),
        Window(
          x=0.45,
          y=0.01,
          width=0.35,
          height=0.52));
      Modelica.Blocks.Interfaces.BooleanOutPort BFunctional annotation (extent=
            [-10, 80; 10, 100], rotation=90);
      Extensions.TDelayExp DelayLifeExp(mean=9, seed=87466351) annotation (
          extent=[20, 10; 40, 30], rotation=-90);
      Place11 Nonfunctional annotation (extent=[10, -20; -10, 0]);
      Extensions.TDelayExp DelayRepairExp(mean=1, seed=31876165) annotation (
          extent=[-40, 30; -20, 10], rotation=-90);
      Place11 Functional(initialState=true) annotation (extent=[-10, 40; 10, 60
            ]);
    equation
      connect(DelayLifeExp.outTransition, Nonfunctional.
        inTransition) annotation (points=[30, 15; 14, -10]);
      connect(Nonfunctional.outTransition, DelayRepairExp.inTransition)
        annotation (points=[-10, -10; -30, 12]);
      connect(Functional.outTransition, DelayLifeExp.inTransition) annotation (
          points=[12, 50; 30, 28]);
      connect(Functional.inTransition, DelayRepairExp.outTransition)
        annotation (points=[-14, 50; -30, 26]);
      BFunctional.signal[1] = Functional.state;
    end SingleComponentAlt;
    model SingleComponentAlt1
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram,
        Icon(Rectangle(extent=[-80, 80; 80, -80], style(color=0, fillColor=49))
            , Text(extent=[0, -76; 0, -108], string="%name")),
        Window(
          x=0.45,
          y=0.01,
          width=0.35,
          height=0.52));
      Modelica.Blocks.Interfaces.BooleanOutPort BFunctional annotation (extent=
            [-10, 80; 10, 100], rotation=90);
      Extensions.TDelayExp DelayLifeExp(mean=9, seed=76481354) annotation (
          extent=[20, 10; 40, 30], rotation=-90);
      Place11 Nonfunctional annotation (extent=[10, -20; -10, 0]);
      Extensions.TDelayExp DelayRepairExp(mean=1, seed=188463) annotation (
          extent=[-40, 30; -20, 10], rotation=-90);
      Place11 Functional(initialState=true) annotation (extent=[-10, 40; 10, 60
            ]);
    equation
      connect(DelayLifeExp.outTransition, Nonfunctional.
        inTransition) annotation (points=[30, 15; 14, -10]);
      connect(Nonfunctional.outTransition, DelayRepairExp.inTransition)
        annotation (points=[-10, -10; -30, 12]);
      connect(Functional.outTransition, DelayLifeExp.inTransition) annotation (
          points=[12, 50; 30, 28]);
      connect(Functional.inTransition, DelayRepairExp.outTransition)
        annotation (points=[-14, 50; -30, 26]);
      BFunctional.signal[1] = Functional.state;
    end SingleComponentAlt1;
    model OR3
      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]), Icon(
          Rectangle(extent=[-100, -100; 100, 100], style(color=5, fillColor=7))
            ,
          Rectangle(extent=[-70, -70; 70, 70], style(
              color=81,
              pattern=1,
              fillColor=30)),
          Text(
            extent=[-52, 24; 46, -32],
            string="OR",
            style(color=0))));
      Modelica.Blocks.Interfaces.BooleanInPort inPort1(final n=1) annotation (
          extent=[-140, 40; -100, 80], layer="icon");
      Modelica.Blocks.Interfaces.BooleanInPort inPort2(final n=1) annotation (
          extent=[-140, -20; -100, 20], layer="icon");
      Modelica.Blocks.Interfaces.BooleanOutPort outPort(final n=1) annotation (
          extent=[100, -10; 120, 10], layer="icon");
      Modelica.Blocks.Interfaces.BooleanInPort inPort3(final n=1) annotation (
          extent=[-140, -80; -100, -40]);
    equation
      outPort.signal[1] = inPort1.signal[1] or inPort2.signal[1]
         or inPort3.signal[1];
    end OR3;
    model SingleComponentNonFunctional
      parameter Real meanLife=10 "Mean lifetime";
      parameter Real meanRepair=1 "Mean repairtime";
      parameter Integer seedLife=2545;
      parameter Integer seedRepair=9832747;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram,
        Icon(Rectangle(extent=[-80, 80; 80, -80], style(color=0, fillColor=49))
            , Text(extent=[0, -76; 0, -108], string="%name")),
        Window(
          x=0.45,
          y=0.01,
          width=0.35,
          height=0.52));
      Modelica.Blocks.Interfaces.BooleanOutPort BNonFunctional annotation (
          extent=[-10, 80; 10, 100], rotation=90);
      Extensions.TDelayExp DelayLifeExp(mean=meanLife, seed=seedLife)
        annotation (extent=[20, 8; 40, 28], rotation=-90);
      Place11 Nonfunctional annotation (extent=[10, -20; -10, 0]);
      Extensions.TDelayExp DelayRepairExp(mean=meanRepair, seed=seedRepair)
        annotation (extent=[-40, 28; -20, 8], rotation=-90);
      Place11 Functional(initialState=true) annotation (extent=[-10, 40; 10, 60
            ]);
    equation
      connect(DelayLifeExp.outTransition, Nonfunctional.
        inTransition) annotation (points=[30, 13; 14, -10]);
      connect(Nonfunctional.outTransition, DelayRepairExp.inTransition)
        annotation (points=[-10, -10; -30, 12]);
      connect(Functional.outTransition, DelayLifeExp.inTransition) annotation (
          points=[12, 50; 30, 24.05]);
      connect(Functional.inTransition, DelayRepairExp.outTransition)
        annotation (points=[-14, 50; -30, 23]);
      BNonFunctional.signal[1] = not Functional.state;
    end SingleComponentNonFunctional;
    model Nonfunctional
      parameter Real meanLife=60*24*10
        "Mean lifetime, exponential distribution";
      parameter Integer seedLife=2545;

      parameter Real meanRepair=60*3 "Mean repairtime, normal distribution";
      parameter Real standardDeviationRepair=60*1
        "Standard deviation of repair-time, normal distribution";
      parameter Integer seed1Repair=1469;
      parameter Integer seed2Repair=8769821;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram,
        Icon(
          Rectangle(extent=[-80, 80; 80, -80], style(color=0, fillColor=49)),
          Text(extent=[0, -76; 0, -108], string="%name"),
          Line(points=[-62, -40; -62, -40; 60, -40]),
          Line(points=[-62, 4; -20, 4; -20, -38; 22, -38; 22, 4; 40, 4; 40, -38
                ; 56, -38; 56, 4; 60, 4], style(thickness=2)),
          Line(points=[-62, -40; -62, 38]),
          Text(extent=[-58, 68; 66, 30], string="non-functional=\"true\""),
          Ellipse(extent=[-10, 80; 10, 62], style(gradient=3, fillColor=46))),
        Window(
          x=0.45,
          y=0.01,
          width=0.35,
          height=0.52));
      Modelica.Blocks.Interfaces.BooleanOutPort BNonFunctional annotation (
          extent=[-10, 80; 10, 100], rotation=90);
      Extensions.TDelayExp DelayLifeExp(mean=meanLife, seed=seedLife)
        annotation (extent=[20, 10; 40, 30], rotation=-90);
      Place11 Nonfunctional annotation (extent=[10, -20; -10, 0]);
      Place11 Functional(initialState=true) annotation (extent=[-10, 40; 10, 60
            ]);
      Extensions.TDelayNormal DelayRepairNormal(
        mean=meanRepair,
        standardDev=standardDeviationRepair,
        seed1=seed1Repair,
        seed2=seed2Repair) annotation (extent=[-40, 10; -20, 30], rotation=90);
    equation
      connect(DelayLifeExp.outTransition, Nonfunctional.
        inTransition) annotation (points=[30, 15; 14, -10]);
      connect(Functional.outTransition, DelayLifeExp.inTransition) annotation (
          points=[12, 50; 30, 24.05]);
      connect(DelayRepairNormal.outTransition, Functional.inTransition)
        annotation (points=[-30, 26; -12, 50]);
      connect(Nonfunctional.outTransition, DelayRepairNormal.inTransition)
        annotation (points=[-12, -10; -30, 12]);
      BNonFunctional.signal[1] = not Functional.state;
    end Nonfunctional;
    model NonfunctionalBIRNG
      parameter Real meanLife=60*24*10
        "Mean lifetime, exponential distribution";
      parameter Real meanRepair=60*3 "Mean repairtime, normal distribution";
      parameter Real standardDeviationRepair=60*1
        "Standard deviation of repair-time, normal distribution";

      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram,
        Icon(
          Rectangle(extent=[-80, 80; 80, -80], style(color=0, fillColor=52)),
          Text(extent=[0, -76; 0, -108], string="%name"),
          Line(points=[-62, -40; -62, -40; 60, -40]),
          Line(points=[-62, 4; -20, 4; -20, -38; 22, -38; 22, 4; 40, 4; 40, -38
                ; 56, -38; 56, 4; 60, 4], style(thickness=2)),
          Line(points=[-62, -40; -62, 38]),
          Text(
            extent=[-58, 68; 66, 30],
            string="non-functional=\"true\"",
            style(fillColor=52)),
          Ellipse(extent=[-10, 80; 10, 62], style(gradient=3, fillColor=46))),
        Window(
          x=0.04,
          y=0.01,
          width=0.68,
          height=0.82));
      Modelica.Blocks.Interfaces.BooleanOutPort BNonFunctional annotation (
          extent=[-10, 80; 10, 100], rotation=90);
      Place11 Nonfunctional annotation (extent=[10, -20; -10, 0]);
      Place11 Functional(initialState=true) annotation (extent=[-10, 40; 10, 60
            ]);
      Extensions.TDelayExpBIRNG TDelayExpBIRNG1(mean=meanLife) annotation (
          extent=[20, 10; 40, 30], rotation=-90);
      Extensions.TDelayNormalBIRNG TDelayNormalBIRNG1(center=meanRepair,
          standardDev=standardDeviationRepair) annotation (extent=[-40, 10; -20
            , 30], rotation=90);
    equation
      connect(TDelayNormalBIRNG1.outTransition, Functional.
        inTransition) annotation (points=[-30, 26; -14, 50]);
      connect(Nonfunctional.outTransition, TDelayNormalBIRNG1.inTransition)
        annotation (points=[-12, -10; -30, 12]);
      connect(Functional.outTransition, TDelayExpBIRNG1.inTransition)
        annotation (points=[12, 50; 30, 28]);
      connect(TDelayExpBIRNG1.outTransition, Nonfunctional.inTransition)
        annotation (points=[30, 14; 14, -10]);
      BNonFunctional.signal[1] = not Functional.state;
    end NonfunctionalBIRNG;
    model FunctionalBIRNG
      parameter Real meanLife=60*24*10
        "Mean lifetime, exponential distribution";
      parameter Real meanRepair=60*3 "Mean repairtime, normal distribution";
      parameter Real standardDeviationRepair=60*1
        "Standard deviation of repair-time, normal distribution";

      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram,
        Icon(
          Rectangle(extent=[-80, 80; 80, -80], style(color=0, fillColor=52)),
          Text(extent=[0, -82; 0, -114], string="%name"),
          Line(points=[-62, -40; -62, -40; 60, -40]),
          Line(points=[-62, 4; -20, 4; -20, -38; 22, -38; 22, 4; 40, 4; 40, -38
                ; 56, -38; 56, 4; 60, 4], style(thickness=2)),
          Line(points=[-62, -40; -62, 38])),
        Window(
          x=0.04,
          y=0.01,
          width=0.68,
          height=0.82));
      Modelica.Blocks.Interfaces.BooleanOutPort BNonFunctional annotation (
          extent=[-10, 80; 10, 100], rotation=90);
      Place11 Nonfunctional annotation (extent=[10, -20; -10, 0]);
      Place11 Functional(initialState=true) annotation (extent=[-10, 40; 10, 60
            ]);
      Extensions.TDelayExpBIRNG TDelayExpBIRNG1(mean=meanLife) annotation (
          extent=[20, 10; 40, 30], rotation=-90);
      Extensions.TDelayNormalBIRNG TDelayNormalBIRNG1(center=meanRepair,
          standardDev=standardDeviationRepair) annotation (extent=[-40, 10; -20
            , 30], rotation=90);
    equation
      connect(TDelayNormalBIRNG1.outTransition, Functional.
        inTransition) annotation (points=[-30, 26; -14, 50]);
      connect(Nonfunctional.outTransition, TDelayNormalBIRNG1.inTransition)
        annotation (points=[-12, -10; -30, 12]);
      connect(Functional.outTransition, TDelayExpBIRNG1.inTransition)
        annotation (points=[12, 50; 30, 28]);
      connect(TDelayExpBIRNG1.outTransition, Nonfunctional.inTransition)
        annotation (points=[30, 14; 14, -10]);
      BNonFunctional.signal[1] = Functional.state;
    end FunctionalBIRNG;
    model EvalBlock
      Real Q;
      Real WeightedSum;
      Real Qavg;
      Real told;
      Real tnew;
      Real tdelta;
      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]));
      Modelica.Blocks.Interfaces.InPort InTokens annotation (
        extent=[-40, 80; -20, 100],
        rotation=-90,
        layer="icon");
      Modelica.Blocks.Interfaces.BooleanInPort InChange annotation (
        extent=[20, 80; 40, 100],
        rotation=-90,
        layer="icon");
    algorithm

      when InChange.signal[1] then
        Q := InTokens.signal[1];
        told := tnew;
        tnew := time;
        tdelta := tnew - told;
        WeightedSum := WeightedSum + Q*tdelta;
        Qavg := WeightedSum/(time + 1e-3);
      end when;
    end EvalBlock;
  end Modules;
  package ExamplesExtendedPetriNets
    extends Modelica.Icons.Library2;
    annotation (Coordsys(
        extent=[0, 0; 504, 364],
        grid=[1, 1],
        component=[20, 20]), Window(
        x=0.1,
        y=0.49,
        width=0.4,
        height=0.4,
        library=1,
        autolayout=1));
    model TestDelayDeterministic
      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]), Window(
          x=0.37,
          y=0.04,
          width=0.59,
          height=0.91));
      Place01 P1(initialState=true) annotation (extent=[-80, -10; -60, 10]);
      Place10 P3 annotation (extent=[40, -10; 60, 10]);
      Transition T1 annotation (extent=[-50, -10; -30, 10]);
      Place11 P2 annotation (extent=[-20, -10; 0, 10]);
      Extensions.TDelay T2(delay=5) annotation (extent=[12, -10; 32, 10]);
    equation
      connect(P1.outTransition, T1.inTransition) annotation (
          points=[-58, 0; -46, 0]);
      connect(T1.outTransition, P2.inTransition) annotation (points=[-34, 0; -
            22, 0]);
      connect(P2.outTransition, T2.inTransition) annotation (points=[0, 0; 16,
            0]);
      connect(T2.outTransition, P3.inTransition) annotation (points=[26, 0; 38
            , 0]);
      T1.condition = time > 5;
    end TestDelayDeterministic;
    model TestCapacity
      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]), Window(
          x=0.36,
          y=0.09,
          width=0.59,
          height=0.77));
      Extensions.TDelay TD1(delay=2.5) annotation (extent=[-48, -10; -28, 10]);
      Extensions.TDelay TD2(delay=1) annotation (extent=[16, -10; 36, 10]);
      Extensions.P10Capacity P3(num_tokens_start=1, N=10) annotation (extent=[
            48, -10; 68, 10]);
      Extensions.P01Capacity P1(num_tokens_start=10, N=10) annotation (extent=[
            -80, -10; -60, 10]);
      Extensions.P11Capacity P2(num_tokens_start=20, N=100) annotation (extent=
            [-16, -10; 4, 10]);
    equation
      connect(P1.outTransition, TD1.inTransition) annotation (
          points=[-60, 0; -46, 0]);
      connect(TD1.outTransition, P2.inTransition) annotation (points=[-34, 0; -
            16, 0]);
      connect(P2.outTransition, TD2.inTransition) annotation (points=[4, 0; 20
            , 0]);
      connect(TD2.outTransition, P3.inTransition) annotation (points=[32, 0; 46
            , 0]);
    end TestCapacity;
    model MM1_Queuing_system
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram,
        Window(
          x=0.45,
          y=0.01,
          width=0.52,
          height=0.93));
      Extensions.P10Capacity Sink(N=1000000) annotation (extent=[70, -10; 90,
            10]);
      Extensions.P01Capacity Source(num_tokens_start=1000000, N=1000000)
        annotation (extent=[-90, -10; -70, 10]);
      Extensions.P11Capacity Queue(N=1000) annotation (extent=[-32, -10; -12,
            10]);
      Extensions.TDelayExp Interarrival(seed=998611) annotation (extent=[-60,
            -10; -40, 10]);
      Extensions.TNoCondition GoToService annotation (extent=[-8, -10; 12, 10])
        ;
      Extensions.TDelayExp Service(mean=8, seed=4556) annotation (extent=[44,
            -10; 64, 10]);
      Place11 Desk annotation (extent=[18, -10; 38, 10]);
      Modules.EvalBlock EvalBlock1 annotation (extent=[-32, -46; -12, -26]);
    equation
      connect(Source.outTransition, Interarrival.inTransition)
        annotation (points=[-69, 0; -58.05, 0]);
      connect(Queue.outTransition, GoToService.inTransition) annotation (points
          =[-11, 0; -4.05, 0]);
      connect(GoToService.outTransition, Desk.inTransition) annotation (points=
            [6, 0; 14, 0]);
      connect(Desk.outTransition, Service.inTransition) annotation (points=[38
            , 0; 47.95, 0]);
      connect(Interarrival.outTransition, Queue.inTransition) annotation (
          points=[-46, 0; -34, 0]);
      connect(Service.outTransition, Sink.inTransition) annotation (points=[58
            , 0; 68, 0]);
      connect(Queue.Bchange, EvalBlock1.InChange) annotation (points=[-18, -10
            ; -18, -27], style(color=5));
      connect(Queue.outTokens, EvalBlock1.InTokens) annotation (points=[-24,
            -10; -24, -26], style(color=3));
    end MM1_Queuing_system;
    model TestDelayPolicy
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram,
        Window(
          x=0.42,
          y=0.05,
          width=0.52,
          height=0.87));
      Extensions.TDelay T2(delay=5) annotation (extent=[10, 20; 30, 40]);
      Place01 P1(initialState=true) annotation (extent=[-90, 20; -70, 40]);
      Place10 P3 annotation (extent=[40, 20; 60, 40]);
      Place22 P2 annotation (extent=[-30, 14; -10, 34]);
      Place11 P4 annotation (extent=[-10, -40; -30, -20]);
      Transition T1 annotation (extent=[-60, 20; -40, 40]);
      Transition T3 annotation (extent=[20, -40; 0, -20]);
      Transition T4 annotation (extent=[-40, -40; -60, -20]);
    equation
      connect(P2.outTransition2, T2.inTransition) annotation (
          points=[-10, 30; 14, 30]);
      connect(T2.outTransition, P3.inTransition) annotation (points=[24, 30; 36
            , 30]);
      connect(P1.outTransition, T1.inTransition) annotation (points=[-70, 30; -
            58, 30]);
      connect(T1.outTransition, P2.inTransition2) annotation (points=[-46, 30;
            -32, 30]);
      connect(P4.inTransition, T3.outTransition) annotation (points=[-6, -30; 4
            , -30]);
      connect(P2.outTransition1, T3.inTransition) annotation (points=[-8, 18; 8
            , 18; 8, 0; 30, 0; 30, -30; 16, -30]);
      connect(P4.outTransition, T4.inTransition) annotation (points=[-30, -30;
            -42, -30]);
      connect(T4.outTransition, P2.inTransition1) annotation (points=[-54, -30
            ; -68, -30; -68, 0; -40, 0; -40, 18; -32, 18]);
      T1.condition = time > 5;
      T3.condition = (time > 7.5) and (time < 8.0);
      T4.condition = time > 12.5;
    end TestDelayPolicy;
    model FunctionalNonfunctional
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram,
        Window(
          x=0.45,
          y=0.01,
          width=0.5,
          height=0.9));
      Extensions.P11Capacity Functional(num_tokens_start=1, N=1) annotation (
          extent=[-10, 60; 10, 40]);
      Extensions.TDelayExp DelayLifeExp(mean=49, seed=6544) annotation (extent=
            [20, 10; 40, 30], rotation=-90);
      Place11 Nonfunctional annotation (extent=[10, -20; -10, 0]);
      Extensions.TDelayExp DelayRepairExp(mean=1, seed=984442) annotation (
          extent=[-40, 30; -20, 10], rotation=-90);
      Modules.EvalBlock EvalBlock1 annotation (extent=[-10, 92; 10, 72]);
    equation
      connect(Functional.outTransition, DelayLifeExp.inTransition)
         annotation (points=[10, 50; 30, 26.05]);
      connect(DelayLifeExp.outTransition, Nonfunctional.inTransition)
        annotation (points=[30, 15; 14, -10]);
      connect(DelayRepairExp.outTransition, Functional.inTransition)
        annotation (points=[-30, 26; -12, 50]);
      connect(Nonfunctional.outTransition, DelayRepairExp.inTransition)
        annotation (points=[-10, -10; -30, 12]);
      connect(Functional.outTokens, EvalBlock1.InTokens) annotation (points=[-3
            , 61; -3, 73]);
      connect(Functional.Bchange, EvalBlock1.InChange) annotation (points=[3,
            61; 3, 73]);
    end FunctionalNonfunctional;
    model TwoSerial
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram,
        Window(
          x=0.08,
          y=0.01,
          width=0.88,
          height=0.88));
      Extensions.P11Capacity Functional(num_tokens_start=1, N=1) annotation (
          extent=[-10, 60; 10, 40]);
      Place11 Nonfunctional annotation (extent=[10, -4; -10, 16]);
      ModelicaAdditions.Blocks.Logical.AND AND1 annotation (extent=[-10, -60;
            10, -40], rotation=90);
      ModelicaAdditions.Blocks.Logical.NOT NOT1 annotation (extent=[40, -40; 60
            , -20]);
      Modules.SingleComponent C1 annotation (extent=[-50, -98; -30, -78]);
      Modules.SingleComponentAlt C2 annotation (extent=[30, -98; 50, -78]);
      Transition restart annotation (extent=[-50, 40; -30, 20], rotation=-90);
      Transition faillure annotation (extent=[50, 18; 30, 38], rotation=-90);
      Modules.EvalBlock EvalBlock1 annotation (extent=[-10, 88; 10, 68]);
    equation
      connect(AND1.outPort, NOT1.inPort) annotation (points=[0,
            -38; 0, -30; 38, -30]);
      connect(Functional.outTransition, faillure.inTransition) annotation (
          points=[12, 50; 38, 36]);
      connect(faillure.outTransition, Nonfunctional.inTransition) annotation (
          points=[40, 22; 14, 6]);
      connect(restart.outTransition, Functional.inTransition) annotation (
          points=[-40, 36; -14, 50]);
      connect(Nonfunctional.outTransition, restart.inTransition) annotation (
          points=[-12, 6; -38, 22]);
      connect(NOT1.outPort, faillure.conditionPort) annotation (points=[62, -30
            ; 72, -30; 72, 28; 52, 28]);
      connect(AND1.outPort, restart.conditionPort) annotation (points=[0, -38;
            0, -30; -70, -30; -70, 30; -50, 30]);
      connect(C1.BFunctional, AND1.inPort1) annotation (points=[-40, -78; -6,
            -62]);
      connect(C2.BFunctional, AND1.inPort2) annotation (points=[40, -78; 6, -62
            ]);
      connect(Functional.outTokens, EvalBlock1.InTokens) annotation (points=[-3
            , 61; -3, 69]);
      connect(Functional.Bchange, EvalBlock1.InChange) annotation (points=[3,
            61; 3, 69]);
    end TwoSerial;
    model TwoOutOfThree
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram,
        Window(
          x=0.15,
          y=0.01,
          width=0.82,
          height=0.85));
      Extensions.P11Capacity Functional(num_tokens_start=1, N=1) annotation (
          extent=[-10, 60; 10, 40]);
      Place11 Nonfunctional annotation (extent=[10, -4; -10, 16]);
      ModelicaAdditions.Blocks.Logical.AND AND1 annotation (extent=[-70, -72;
            -50, -52], rotation=90);
      ModelicaAdditions.Blocks.Logical.NOT NOT1 annotation (extent=[40, -20; 60
            , 0]);
      Modules.SingleComponent C1 annotation (extent=[-80, -100; -60, -80]);
      Modules.SingleComponentAlt C2 annotation (extent=[-10, -100; 10, -80]);
      Transition restart annotation (extent=[-50, 40; -30, 20], rotation=-90);
      Transition faillure annotation (extent=[50, 18; 30, 38], rotation=-90);
      Modules.SingleComponentAlt1 C3 annotation (extent=[60, -100; 80, -80]);
      ModelicaAdditions.Blocks.Logical.AND AND2 annotation (extent=[-10, -72;
            10, -52], rotation=90);
      ModelicaAdditions.Blocks.Logical.AND AND3 annotation (extent=[50, -72; 70
            , -52], rotation=90);
      Modules.OR3 OR3_1 annotation (extent=[-10, -40; 10, -20], rotation=90);
      Modules.EvalBlock EvalBlock1 annotation (extent=[-10, 88; 10, 68]);
    equation
      connect(Functional.outTransition, faillure.inTransition)
        annotation (points=[12, 50; 38, 36]);
      connect(faillure.outTransition, Nonfunctional.inTransition) annotation (
          points=[40, 22; 14, 6]);
      connect(restart.outTransition, Functional.inTransition) annotation (
          points=[-40, 36; -14, 50]);
      connect(Nonfunctional.outTransition, restart.inTransition) annotation (
          points=[-12, 6; -38, 22]);
      connect(NOT1.outPort, faillure.conditionPort) annotation (points=[62, -10
            ; 72, -10; 72, 28; 52, 28]);
      connect(C1.BFunctional, AND1.inPort1) annotation (points=[-70, -81; -66,
            -74]);
      connect(AND1.inPort2, C2.BFunctional) annotation (points=[-54, -74; 0,
            -81]);
      connect(C2.BFunctional, AND2.inPort1) annotation (points=[0, -81; -6, -74
            ]);
      connect(C3.BFunctional, AND2.inPort2) annotation (points=[70, -81; 6, -74
            ]);
      connect(C1.BFunctional, AND3.inPort1) annotation (points=[-70, -81; 54,
            -76]);
      connect(C3.BFunctional, AND3.inPort2) annotation (points=[70, -81; 66,
            -76]);
      connect(AND1.outPort, OR3_1.inPort1) annotation (points=[-60, -50; -6,
            -42]);
      connect(AND2.outPort, OR3_1.inPort2) annotation (points=[0, -52; 0, -42])
        ;
      connect(AND3.outPort, OR3_1.inPort3) annotation (points=[60, -50; 6, -42]
        );
      connect(OR3_1.outPort, NOT1.inPort) annotation (points=[0, -20; 0, -10;
            38, -10]);
      connect(OR3_1.outPort, restart.conditionPort) annotation (points=[0, -20
            ; 0, -10; -70, -10; -70, 30; -50, 30]);
      connect(Functional.outTokens, EvalBlock1.InTokens) annotation (points=[-3
            , 61; -3, 69]);
      connect(Functional.Bchange, EvalBlock1.InChange) annotation (points=[3,
            61; 3, 69]);
    end TwoOutOfThree;
  end ExamplesExtendedPetriNets;
  package Extensions
    extends Modelica.Icons.Library2;
    annotation (
      Coordsys(
        extent=[0, 0; 965, 589],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.18,
        y=0.35,
        width=0.76,
        height=0.62,
        library=1,
        autolayout=1),
      Documentation(info="See Knuth D.E. (1981). The Art of Computer Programming,
Seminumerical Algorithms, vol. 2, 2nd ed., Addison-Wesley, U.S.A.
 as a reference to random number generation.
"));
    model TDelay "Transition with one input and one output connection"
      parameter Real delay=5;

      Boolean activated;
      Boolean delay_passed;
      Boolean fire;

      Real last_activation_time;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[1, 1],
          component=[20, 20]),
        Window(
          x=0.45,
          y=0.01,
          width=0.35,
          height=0.52),
        Icon(
          Line(points=[-40, 0; -5, 0], style(color=41)),
          Line(points=[40, 0; 5, 0], style(color=41)),
          Rectangle(extent=[-20, 80; 20, -79], style(
              color=41,
              fillColor=41,
              fillPattern=1)),
          Text(
            extent=[-17, 21; 17, -20],
            string="D",
            style(color=0)),
          Text(
            extent=[-17, 21; 17, -20],
            string="D",
            style(color=0)),
          Line(points=[-20, 80; 20, 80; 20, -79; -20, -79; -20, 80], style(
                color=0, thickness=2)),
          Text(extent=[0, -82; 0, -112], string="delay = %delay"),
          Text(extent=[0, 84; 0, 114], string="%name")),
        Diagram(
          Rectangle(extent=[-20, 80; 20, -79], style(
              color=41,
              fillColor=41,
              fillPattern=1)),
          Line(points=[-38, 0; -5, 0], style(color=41)),
          Line(points=[40, 0; 5, 0], style(color=41)),
          Text(
            extent=[-17, 21; 17, -20],
            string="D",
            style(color=0)),
          Line(points=[-20, 80; 20, 80; 20, -79; -20, -79; -20, 80], style(
                color=0, thickness=2))));
      PetriNets.Interfaces.FirePortIn inTransition annotation (extent=[-81, -21
            ; -40, 20]);
      PetriNets.Interfaces.SetPortOut outTransition annotation (extent=[40, -10
            ; 60, 10]);
    equation

      //activation of transition
      activated = inTransition.state;

      //set activation time
      when activated then
        last_activation_time = time;
      end when;

      //activated and delay passed
      delay_passed = activated and ((time - delay) > last_activation_time);

      //fire command
      fire = activated and delay_passed and not outTransition.state;

      //propagate firing to in and output places
      inTransition.fire = fire;
      outTransition.set = fire;

    end TDelay;
    model TNoCondition "Transition with one input and one output connection"
      Boolean fire;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[1, 1],
          component=[20, 20]),
        Window(
          x=0.45,
          y=0.01,
          width=0.35,
          height=0.52),
        Icon(
          Rectangle(extent=[-5, 80; 5, -80], style(
              color=41,
              fillColor=41,
              fillPattern=1)),
          Line(points=[-40, 0; -5, 0], style(color=41)),
          Line(points=[40, 0; 5, 0], style(color=41)),
          Text(extent=[0, 84; 0, 114], string="%name")),
        Diagram(
          Rectangle(extent=[-5, 80; 5, -80], style(
              color=41,
              fillColor=41,
              fillPattern=1)),
          Line(points=[-38, 0; -5, 0], style(color=41)),
          Line(points=[40, 0; 5, 0], style(color=41))));
      PetriNets.Interfaces.FirePortIn inTransition annotation (extent=[-81, -21
            ; -40, 20]);
      PetriNets.Interfaces.SetPortOut outTransition annotation (extent=[40, -10
            ; 60, 10]);
    equation
      fire = inTransition.state and not outTransition.state;
      inTransition.fire = fire;
      outTransition.set = fire;
    end TNoCondition;
    model P10Capacity "Place with one input and one output transition"
      parameter Integer num_tokens_start=0 "Initial number of tokens";
      parameter Integer N=1 "Capacity limit for tokens";

      Integer num_tokens(start=num_tokens_start)
        "number of tokens present on the place";
      Boolean full;

      Integer new_num_tokens(start=num_tokens_start);
      Boolean tokenin;
    public
      PetriNets.Interfaces.SetPortIn inTransition annotation (extent=[-140, -20
            ; -100, 20]);
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Window(
          x=0.46,
          y=0.02,
          width=0.48,
          height=0.88),
        Icon(
          Ellipse(extent=[-100, -100; 100, 100], style(
              color=0,
              thickness=2,
              fillPattern=0)),
          Text(
            extent=[-64, 38; 80, -42],
            string="N = %N",
            style(color=0)),
          Text(extent=[0, 100; 0, 130], string="%name")),
        Diagram(Ellipse(extent=[-100, -100; 100, 100], style(color=0, thickness
                =2))));
    equation
      // Set new token number for next iteration
      num_tokens = pre(new_num_tokens);

      tokenin = inTransition.set and not full;

      when tokenin then
        new_num_tokens = num_tokens + 1;
      end when;

      full = num_tokens == N;

      // Report state to input and output transitions
      inTransition.state = full and not pre(tokenin);
    end P10Capacity;
    model P01Capacity "Place with one input and one output transition"
      parameter Integer num_tokens_start=0 "Initial number of tokens";
      parameter Integer N=1 "Capacity limit for tokens";

      Integer num_tokens(start=num_tokens_start)
        "number of tokens present on the place";
      Boolean empty;

      Integer new_num_tokens(start=num_tokens_start);
      Boolean tokenout;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Window(
          x=0.45,
          y=0.01,
          width=0.35,
          height=0.52),
        Icon(
          Ellipse(extent=[-100, -100; 100, 100], style(
              color=0,
              thickness=2,
              fillPattern=0)),
          Text(
            extent=[-64, 38; 80, -42],
            string="N = %N",
            style(color=0)),
          Text(extent=[0, 100; 0, 130], string="%name")),
        Diagram(Ellipse(extent=[-100, -100; 100, 100], style(color=0, thickness
                =2))));
      Interfaces.FirePortOut outTransition annotation (extent=[100, -12; 120, 8
            ]);
    equation
      // Set new token number for next iteration
      num_tokens = pre(new_num_tokens);

      tokenout = outTransition.fire and not empty;

      when tokenout then
        new_num_tokens = num_tokens - 1;
      end when;

      empty = num_tokens == 0;

      // Report state to input and output transitions
      outTransition.state = not empty and not pre(tokenout);
    end P01Capacity;
    model P11Capacity "Place with one input and one output transition"
      parameter Integer num_tokens_start=0 "Initial number of tokens";
      parameter Integer N=1 "Capacity limit for tokens";

      Integer num_tokens(start=num_tokens_start)
        "number of tokens present on the place";
      Boolean full;
      Boolean empty;

      Integer new_num_tokens(start=num_tokens_start);
      Boolean tokenin;
      Boolean tokenout;
      Boolean tokeninout;

      Real Qtotal;
      Real Qavg;
    public
      PetriNets.Interfaces.SetPortIn inTransition annotation (extent=[-140, -20
            ; -100, 20]);
      PetriNets.Interfaces.FirePortOut outTransition annotation (extent=[100, -
            10; 120, 10]);
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Window(
          x=0.45,
          y=0.01,
          width=0.35,
          height=0.52),
        Icon(
          Ellipse(extent=[-100, -100; 100, 100], style(
              color=0,
              thickness=2,
              fillPattern=0)),
          Text(
            extent=[-64, 38; 80, -42],
            string="N = %N",
            style(color=0)),
          Text(extent=[0, 100; 0, 130], string="%name")),
        Diagram(Ellipse(extent=[-100, -100; 100, 100], style(color=0, thickness
                =2))));
      Modelica.Blocks.Interfaces.OutPort outTokens annotation (extent=[-40, -
            120; -20, -100], rotation=-90);
      Modelica.Blocks.Interfaces.BooleanOutPort Bchange annotation (extent=[20
            , -120; 40, -100], rotation=-90);
    equation
      // Set new token number for next iteration
      num_tokens = pre(new_num_tokens);

      tokenin = inTransition.set and not full and not outTransition.fire;
      tokenout = outTransition.fire and not empty and not inTransition.set;
      tokeninout = inTransition.set and outTransition.fire;

      when {tokenin,tokenout,tokeninout} then
        new_num_tokens = if edge(tokenin) then num_tokens + 1 else if edge(
          tokenout) then num_tokens - 1 else num_tokens;

      end when;

      full = num_tokens == N;
      empty = num_tokens == 0;

      // Report state to input and output transitions
      inTransition.state = full and not pre(tokenin) and not pre(tokeninout);
      outTransition.state = not empty and not pre(tokenout) and not pre(
        tokeninout);

      outTokens.signal[1] = num_tokens;
      Bchange.signal[1] = not (num_tokens == new_num_tokens);

      der(Qtotal) = num_tokens;
      Qavg = Qtotal/(time + 1e-3);
    end P11Capacity;
    model TDelayExp "Transition with one input and one output connection"
      parameter Real mean=10 "Exponential mean";
      parameter Integer seed=1973272912;

      Boolean activated;
      Boolean delay_passed;
      Boolean fire;

      Real last_activation_time;
      Real delay;

      Integer Xi(start=seed);
      Integer Xiplus;
      Integer m=2147483647;
      //(2^31) - 1
      Integer a=7^5;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[1, 1],
          component=[20, 20]),
        Window(
          x=0.39,
          y=0.09,
          width=0.59,
          height=0.87),
        Icon(
          Line(points=[-40, 0; -5, 0], style(color=41)),
          Line(points=[40, 0; 5, 0], style(color=41)),
          Text(extent=[0, 42; 2, 116], string="%name"),
          Rectangle(extent=[-20, 80; 20, -79], style(
              color=41,
              fillColor=49,
              fillPattern=1)),
          Text(
            extent=[-17, 21; 17, -20],
            string="D",
            style(color=0)),
          Text(
            extent=[-17, 21; 17, -20],
            string="D",
            style(color=0)),
          Line(points=[-20, 80; 20, 80; 20, -79; -20, -79; -20, 80], style(
                color=0, thickness=2)),
          Text(extent=[0, 84; 0, 114], string="%name"),
          Text(extent=[-1, -82; -1, -111], string="mean = %mean")),
        Diagram(
          Rectangle(extent=[-20, 80; 20, -79], style(
              color=41,
              fillColor=49,
              fillPattern=1)),
          Line(points=[-38, 0; -5, 0], style(color=41)),
          Line(points=[40, 0; 5, 0], style(color=41)),
          Text(
            extent=[-17, 21; 17, -20],
            string="D",
            style(color=0)),
          Line(points=[-20, 80; 20, 80; 20, -79; -20, -79; -20, 80], style(
                color=0, thickness=2))));
      PetriNets.Interfaces.FirePortIn inTransition annotation (extent=[-81, -21
            ; -40, 20]);
      PetriNets.Interfaces.SetPortOut outTransition annotation (extent=[40, -10
            ; 60, 10]);
    equation
      //activation of transition
      activated = inTransition.state;

      //activated and delay passed
      delay_passed = activated and ((time - delay) > last_activation_time);

      //fire command
      fire = activated and delay_passed and not outTransition.state;

      //propagate firing to in and output places
      inTransition.fire = fire;
      outTransition.set = fire;

      //set activation time
    algorithm
      when activated then
        last_activation_time := time;
        //Multiplicative Linear Congruential Method
        Xiplus := mod(a*Xi, m);
        delay := -mean*ln(Xiplus/m);
        Xi := Xiplus;


          //The built in function only runs for a certain number of samples and then
        //breaks down
        //delay := -mean*ln(RandomUniform(time));
      end when;
    end TDelayExp;
    model Place11B "Place with one input and one output transition"
      parameter Boolean initialState=false "Initial value of state";
      Boolean state(final start=initialState) "State of place";
    protected
      Boolean newState(final start=initialState);
    public
      PetriNets.Interfaces.SetPortIn inTransition annotation (extent=[-140, -20
            ; -100, 20]);
      PetriNets.Interfaces.FirePortOut outTransition annotation (extent=[100, -
            10; 120, 10]);
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Window(
          x=0.45,
          y=0.01,
          width=0.35,
          height=0.52),
        Icon(Ellipse(extent=[-100, -100; 100, 100], style(color=41, fillColor=7
              )), Text(extent=[0, 100; 0, 130], string="%name")),
        Diagram(Ellipse(extent=[-100, -100; 100, 100], style(color=41))));
      Modelica.Blocks.Interfaces.BooleanOutPort BState annotation (extent=[-10
            , -100; 10, -120], rotation=90);
    equation
      // Set new state for next iteration
      state = pre(newState);
      newState = inTransition.set or state and not outTransition.fire;

      // Report state to input and output transitions
      inTransition.state = state;
      outTransition.state = state;

      BState.signal[1] = state;
    end Place11B;
    model SynchronizeNoCondition
      "Transition with two input and one output connections"
      Boolean fire;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Window(
          x=0.45,
          y=0.01,
          width=0.35,
          height=0.52),
        Icon(
          Rectangle(extent=[-5, 80; 5, -80], style(
              color=41,
              fillColor=41,
              fillPattern=1)),
          Line(points=[-40, 0; -5, 0], style(color=41)),
          Line(points=[40, 0; 5, 0], style(color=41)),
          Line(points=[-40, 60; -5, 60], style(color=41)),
          Text(extent=[0, 84; 0, 114], string="%name")),
        Diagram(
          Rectangle(extent=[-5, 80; 5, -80], style(
              color=41,
              fillColor=41,
              fillPattern=1)),
          Line(points=[-38, 0; -1, 0], style(color=41)),
          Line(points=[40, 0; 5, 0], style(color=41)),
          Line(points=[-40, 60; -3, 60], style(color=41))));
      PetriNets.Interfaces.FirePortIn inTransition1 annotation (extent=[-80, -
            20; -40, 20]);
      PetriNets.Interfaces.FirePortIn inTransition2 annotation (extent=[-80, 80
            ; -40, 40]);
      PetriNets.Interfaces.SetPortOut outTransition annotation (extent=[40, -10
            ; 60, 10]);
    equation
      fire = inTransition1.state and inTransition2.state and not
        outTransition.state;
      inTransition1.fire = fire;
      inTransition2.fire = fire;
      outTransition.set = fire;
    end SynchronizeNoCondition;
    model ParallelNoCondition
      "Transition with one input and two output connections"
      Boolean fire;

      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[1, 1],
          component=[20, 20]),
        Window(
          x=0.45,
          y=0.01,
          width=0.35,
          height=0.52),
        Icon(
          Rectangle(extent=[-5, 80; 5, -80], style(
              color=41,
              fillColor=41,
              fillPattern=1)),
          Line(points=[-40, 0; -5, 0], style(color=41)),
          Line(points=[40, 60; 5, 60], style(color=41)),
          Line(points=[40, 0; 5, 0], style(color=41)),
          Text(extent=[0, 84; 0, 114], string="%name")),
        Diagram(
          Rectangle(extent=[-5, 80; 5, -80], style(
              color=41,
              fillColor=41,
              fillPattern=1)),
          Line(points=[-38, 0; -5, 0], style(color=41)),
          Line(points=[40, 0; 5, 0], style(color=41)),
          Line(points=[40, 60; 5, 60], style(color=41))));
      PetriNets.Interfaces.FirePortIn inTransition annotation (extent=[-81, -21
            ; -40, 20]);
      PetriNets.Interfaces.SetPortOut outTransition1 annotation (extent=[40, -
            10; 60, 10]);
      PetriNets.Interfaces.SetPortOut outTransition2 annotation (extent=[40, 50
            ; 60, 70]);
    equation
      fire = inTransition.state and not (outTransition1.state or
        outTransition2.state);
      inTransition.fire = fire;
      outTransition1.set = fire;
      outTransition2.set = fire;
    end ParallelNoCondition;
    model TDelayWeibull "Transition with one input and one output connection"
      parameter Real alpha=1 "Weibull shape parameter alpha";
      parameter Real beta=2 "Weibull shape parameter beta";
      parameter Integer seed=1973272912;

      Boolean activated;
      Boolean delay_passed;
      Boolean fire;

      Real last_activation_time;
      Real delay;

      Integer Xi(start=seed);
      Integer Xiplus;
      Integer m=2147483647;
      //(2^31) - 1
      Integer a=7^5;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[1, 1],
          component=[20, 20]),
        Window(
          x=0.45,
          y=0.01,
          width=0.51,
          height=0.78),
        Icon(
          Line(points=[-40, 0; -5, 0], style(color=41)),
          Line(points=[40, 0; 5, 0], style(color=41)),
          Text(extent=[0, 42; 2, 116], string="%name"),
          Rectangle(extent=[-20, 80; 20, -79], style(
              color=41,
              fillColor=49,
              fillPattern=1)),
          Text(
            extent=[-17, 21; 17, -20],
            string="D",
            style(color=0)),
          Text(
            extent=[-17, 21; 17, -20],
            string="D",
            style(color=0)),
          Line(points=[-20, 80; 20, 80; 20, -79; -20, -79; -20, 80], style(
                color=0, thickness=2)),
          Text(extent=[-90, -81; 90, -106], string="mean = %mean"),
          Text(extent=[0, 84; 0, 114], string="%name")),
        Diagram(
          Rectangle(extent=[-20, 80; 20, -79], style(
              color=41,
              fillColor=49,
              fillPattern=1)),
          Line(points=[-38, 0; -5, 0], style(color=41)),
          Line(points=[40, 0; 5, 0], style(color=41)),
          Text(
            extent=[-17, 21; 17, -20],
            string="D",
            style(color=0)),
          Line(points=[-20, 80; 20, 80; 20, -79; -20, -79; -20, 80], style(
                color=0, thickness=2))));
      PetriNets.Interfaces.FirePortIn inTransition annotation (extent=[-81, -21
            ; -40, 20]);
      PetriNets.Interfaces.SetPortOut outTransition annotation (extent=[40, -10
            ; 60, 10]);
    equation
      //activation of transition
      activated = inTransition.state;

      //activated and delay passed
      delay_passed = activated and ((time - delay) > last_activation_time);

      //fire command
      fire = activated and delay_passed and not outTransition.state;

      //propagate firing to in and output places
      inTransition.fire = fire;
      outTransition.set = fire;

      //set activation time
    algorithm
      when activated then
        last_activation_time := time;
        //Multiplicative Linear Congruential Method
        Xiplus := mod(a*Xi, m);
        delay := (-(1/alpha)*ln(1 - Xiplus/m))^(1/beta);
        Xi := Xiplus;


          //The built in function only runs for a certain number of samples and then
        //breaks down
        //delay := -mean*ln(RandomUniform(time));
      end when;
    end TDelayWeibull;
    model TDelayExpBIRNG "Transition with one input and one output connection"

      parameter Real mean=10 "Exponential mean";

      Boolean activated;
      Boolean delay_passed;
      Boolean fire;

      Real last_activation_time;
      Real delay;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[1, 1],
          component=[20, 20]),
        Window(
          x=0.45,
          y=0.01,
          width=0.35,
          height=0.52),
        Icon(
          Line(points=[-40, 0; -5, 0], style(color=41)),
          Line(points=[40, 0; 5, 0], style(color=41)),
          Text(extent=[0, 42; 2, 116], string="%name"),
          Rectangle(extent=[-20, 80; 20, -79], style(
              color=41,
              fillColor=52,
              fillPattern=1)),
          Text(
            extent=[-17, 21; 17, -20],
            string="D",
            style(color=0)),
          Text(
            extent=[-17, 21; 17, -20],
            string="D",
            style(color=0)),
          Line(points=[-20, 80; 20, 80; 20, -79; -20, -79; -20, 80], style(
                color=0, thickness=2)),
          Text(extent=[-2, -83; -2, -112], string="mean = %mean"),
          Text(extent=[0, 84; 0, 114], string="%name")),
        Diagram(
          Rectangle(extent=[-20, 79; 20, -80], style(
              color=41,
              fillColor=52,
              fillPattern=1)),
          Line(points=[-38, 0; -5, 0], style(color=41)),
          Line(points=[40, 0; 5, 0], style(color=41)),
          Text(
            extent=[-17, 21; 17, -20],
            string="D",
            style(color=0)),
          Line(points=[-20, 80; 20, 80; 20, -79; -20, -79; -20, 80], style(
                color=0, thickness=2))));
      PetriNets.Interfaces.FirePortIn inTransition annotation (extent=[-81, -21
            ; -40, 20]);
      PetriNets.Interfaces.SetPortOut outTransition annotation (extent=[40, -10
            ; 60, 10]);
    equation
      //activation of transition
      activated = inTransition.state;

      //activated and delay passed
      delay_passed = activated and ((time - delay) > last_activation_time);

      //fire command
      fire = activated and delay_passed and not outTransition.state;

      //propagate firing to in and output places
      inTransition.fire = fire;
      outTransition.set = fire;

      //set activation time
    algorithm
      when activated then
        last_activation_time := time;
        //The built in function only runs for a certain number (quite large)
        // of samples and then miraculously creates extremly large values!
        delay := -mean*ln(RandomUniform(time));
      end when;
    end TDelayExpBIRNG;
    model TDelayNormalBIRNG
      "Transition with one input and one output connection"
      parameter Real center=5.0 "Normal around center";
      parameter Real standardDev=1.0
        "Standard deviation of the normal distribution";

      Boolean activated;
      Boolean delay_passed;
      Boolean fire;

      Real last_activation_time;
      Real delay;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[1, 1],
          component=[20, 20]),
        Window(
          x=0.45,
          y=0.01,
          width=0.35,
          height=0.52),
        Icon(
          Line(points=[-40, 0; -5, 0], style(color=41)),
          Line(points=[40, 0; 5, 0], style(color=41)),
          Rectangle(extent=[-20, 80; 20, -79], style(
              color=41,
              fillColor=52,
              fillPattern=1)),
          Text(
            extent=[-17, 21; 17, -20],
            string="D",
            style(color=0)),
          Text(
            extent=[-17, 22; 17, -19],
            string="D",
            style(color=0)),
          Line(points=[-20, 80; 20, 80; 20, -79; -20, -79; -20, 80], style(
                color=0, thickness=2)),
          Text(extent=[3, -83; 3, -112], string="center = %center"),
          Text(extent=[0, 84; 0, 114], string="%name")),
        Diagram(
          Rectangle(extent=[-20, 80; 20, -79], style(
              color=41,
              fillColor=49,
              fillPattern=1)),
          Line(points=[-38, 0; -5, 0], style(color=41)),
          Line(points=[40, 0; 5, 0], style(color=41)),
          Text(
            extent=[-17, 21; 17, -20],
            string="D",
            style(color=0)),
          Line(points=[-20, 80; 20, 80; 20, -79; -20, -79; -20, 80], style(
                color=0, thickness=2))));
      PetriNets.Interfaces.FirePortIn inTransition annotation (extent=[-81, -21
            ; -40, 20]);
      PetriNets.Interfaces.SetPortOut outTransition annotation (extent=[40, -10
            ; 60, 10]);
    equation
      //activation of transition
      activated = inTransition.state;

      //set activation time
      when activated then
        last_activation_time = time;
        delay = center + standardDev*(RandomNormal(time));
      end when;

      //activated and delay passed
      delay_passed = activated and ((time - delay) > last_activation_time);

      //fire command
      fire = activated and delay_passed and not outTransition.state;

      //propagate firing to in and output places
      inTransition.fire = fire;
      outTransition.set = fire;
    end TDelayNormalBIRNG;
    model TDelayUniformBIRNG
      "Transition with one input and one output connection"
      parameter Real min=0 "Uniform between min..max";
      parameter Real max=1 "Uniform between min..max";

      Boolean activated;
      Boolean delay_passed;
      Boolean fire;

      Real last_activation_time;
      Real delay;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[1, 1],
          component=[20, 20]),
        Window(
          x=0.45,
          y=0.01,
          width=0.35,
          height=0.52),
        Icon(
          Line(points=[-40, 0; -5, 0], style(color=41)),
          Line(points=[40, 0; 5, 0], style(color=41)),
          Rectangle(extent=[-20, 80; 20, -79], style(
              color=41,
              fillColor=52,
              fillPattern=1)),
          Text(
            extent=[-17, 21; 17, -20],
            string="D",
            style(color=0)),
          Text(
            extent=[-17, 21; 17, -20],
            string="D",
            style(color=0)),
          Line(points=[-20, 80; 20, 80; 20, -79; -20, -79; -20, 80], style(
                color=0, thickness=2)),
          Text(extent=[-57, -80; 70, -111], string="max = %max"),
          Text(extent=[0, 84; 0, 114], string="%name")),
        Diagram(
          Rectangle(extent=[-20, 80; 20, -79], style(
              color=41,
              fillColor=49,
              fillPattern=1)),
          Line(points=[-38, 0; -5, 0], style(color=41)),
          Line(points=[40, 0; 5, 0], style(color=41)),
          Text(
            extent=[-17, 21; 17, -20],
            string="D",
            style(color=0)),
          Line(points=[-20, 80; 20, 80; 20, -79; -20, -79; -20, 80], style(
                color=0, thickness=2))));
      PetriNets.Interfaces.FirePortIn inTransition annotation (extent=[-81, -21
            ; -40, 20]);
      PetriNets.Interfaces.SetPortOut outTransition annotation (extent=[40, -10
            ; 60, 10]);
    equation
      //activation of transition
      activated = inTransition.state;

      //set activation time
      when activated then
        last_activation_time = time;
        delay = min + (max - min)*(RandomUniform(time));
      end when;

      //activated and delay passed
      delay_passed = activated and ((time - delay) > last_activation_time);

      //fire command
      fire = activated and delay_passed and not outTransition.state;

      //propagate firing to in and output places
      inTransition.fire = fire;
      outTransition.set = fire;
    end TDelayUniformBIRNG;
    model TDelayWeibullBIRNG
      "Transition with one input and one output connection"
      parameter Real alpha=1 "Weibull shape parameter alpha";
      parameter Real beta=2 "Weibull shape parameter beta";

      Boolean activated;
      Boolean delay_passed;
      Boolean fire;

      Real last_activation_time;
      Real delay;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[1, 1],
          component=[20, 20]),
        Window(
          x=0.45,
          y=0.01,
          width=0.35,
          height=0.52),
        Icon(
          Line(points=[-40, 0; -5, 0], style(color=41)),
          Line(points=[40, 0; 5, 0], style(color=41)),
          Text(extent=[0, 42; 2, 116], string="%name"),
          Rectangle(extent=[-20, 80; 20, -79], style(
              color=41,
              fillColor=52,
              fillPattern=1)),
          Text(
            extent=[-17, 21; 17, -20],
            string="D",
            style(color=0)),
          Text(
            extent=[-17, 21; 17, -20],
            string="D",
            style(color=0)),
          Line(points=[-20, 80; 20, 80; 20, -79; -20, -79; -20, 80], style(
                color=0, thickness=2)),
          Text(extent=[-90, -81; 90, -106], string="mean = %mean"),
          Text(extent=[0, 84; 0, 114], string="%name")),
        Diagram(
          Rectangle(extent=[-20, 80; 20, -79], style(
              color=41,
              fillColor=49,
              fillPattern=1)),
          Line(points=[-38, 0; -5, 0], style(color=41)),
          Line(points=[40, 0; 5, 0], style(color=41)),
          Text(
            extent=[-17, 21; 17, -20],
            string="D",
            style(color=0)),
          Line(points=[-20, 80; 20, 80; 20, -79; -20, -79; -20, 80], style(
                color=0, thickness=2))));
      PetriNets.Interfaces.FirePortIn inTransition annotation (extent=[-81, -21
            ; -40, 20]);
      PetriNets.Interfaces.SetPortOut outTransition annotation (extent=[40, -10
            ; 60, 10]);
    equation
      //activation of transition
      activated = inTransition.state;

      //activated and delay passed
      delay_passed = activated and ((time - delay) > last_activation_time);

      //fire command
      fire = activated and delay_passed and not outTransition.state;

      //propagate firing to in and output places
      inTransition.fire = fire;
      outTransition.set = fire;

      //set activation time
    algorithm
      when activated then
        last_activation_time := time;
        delay := (-(1/alpha)*ln(1 - RandomUniform(time)))^(1/beta);
      end when;
    end TDelayWeibullBIRNG;
    model TDelayUniform "Transition with one input and one output connection"
      parameter Real min=0 "Uniform between min..max";
      parameter Real max=1 "Uniform between min..max";
      parameter Integer seed=1973272912;

      Boolean activated;
      Boolean delay_passed;
      Boolean fire;

      Real last_activation_time;
      Real delay;

      Integer Xi(start=seed);
      Integer Xiplus;
      Integer m=2147483647;
      //(2^31) - 1
      Integer a=7^5;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[1, 1],
          component=[20, 20]),
        Window(
          x=0.56,
          y=0.11,
          width=0.33,
          height=0.83),
        Icon(
          Line(points=[-40, 0; -5, 0], style(color=41)),
          Line(points=[40, 0; 5, 0], style(color=41)),
          Text(extent=[0, 42; 2, 116], string="%name"),
          Rectangle(extent=[-20, 80; 20, -79], style(
              color=41,
              fillColor=49,
              fillPattern=1)),
          Text(
            extent=[-17, 21; 17, -20],
            string="D",
            style(color=0)),
          Text(
            extent=[-17, 21; 17, -20],
            string="D",
            style(color=0)),
          Line(points=[-20, 80; 20, 80; 20, -79; -20, -79; -20, 80], style(
                color=0, thickness=2)),
          Text(extent=[-90, -81; 90, -106], string="mean = %mean"),
          Text(extent=[0, 84; 0, 114], string="%name")),
        Diagram(
          Rectangle(extent=[-20, 80; 20, -79], style(
              color=41,
              fillColor=49,
              fillPattern=1)),
          Line(points=[-38, 0; -5, 0], style(color=41)),
          Line(points=[40, 0; 5, 0], style(color=41)),
          Text(
            extent=[-17, 21; 17, -20],
            string="D",
            style(color=0)),
          Line(points=[-20, 80; 20, 80; 20, -79; -20, -79; -20, 80], style(
                color=0, thickness=2))));
      PetriNets.Interfaces.FirePortIn inTransition annotation (extent=[-81, -21
            ; -40, 20]);
      PetriNets.Interfaces.SetPortOut outTransition annotation (extent=[40, -10
            ; 60, 10]);
    equation
      //activation of transition
      activated = inTransition.state;

      //activated and delay passed
      delay_passed = activated and ((time - delay) > last_activation_time);

      //fire command
      fire = activated and delay_passed and not outTransition.state;

      //propagate firing to in and output places
      inTransition.fire = fire;
      outTransition.set = fire;

      //set activation time
    algorithm
      when activated then
        last_activation_time := time;
        Xiplus := mod(a*Xi, m);
        delay := min + (max - min)*(Xiplus/m);
        Xi := Xiplus;
      end when;
    end TDelayUniform;
    model TDelayNormal "Transition with one input and one output connection"
      parameter Real mean=10 "Mean of normal distribution";
      parameter Real standardDev=1 "Standard deviation of normal distribution";
      parameter Integer seed1=1973272912;
      parameter Integer seed2=28864;

      Boolean activated;
      Boolean delay_passed;
      Boolean fire;

      Real last_activation_time;
      Real delay;

      Integer X1(start=seed1);
      Integer X1plus;
      Integer X2(start=seed2);
      Integer X2plus;
      Real YnormalStandard;
      Real Ynormal;
      Integer m=2147483647;
      //(2^31) - 1
      Integer a=7^5;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[1, 1],
          component=[20, 20]),
        Window(
          x=0.45,
          y=0.01,
          width=0.35,
          height=0.49),
        Icon(
          Line(points=[-40, 0; -5, 0], style(color=41)),
          Line(points=[40, 0; 5, 0], style(color=41)),
          Rectangle(extent=[-20, 80; 20, -79], style(
              color=41,
              fillColor=49,
              fillPattern=1)),
          Text(
            extent=[-17, 21; 17, -20],
            string="D",
            style(color=0)),
          Text(
            extent=[-17, 21; 17, -20],
            string="D",
            style(color=0)),
          Line(points=[-20, 80; 20, 80; 20, -79; -20, -79; -20, 80], style(
                color=0, thickness=2)),
          Text(extent=[-90, -81; 90, -106], string="mean = %mean"),
          Text(extent=[0, 84; 0, 114], string="%name"),
          Text(extent=[-88, -102; 92, -127], string="stddev = %standardDev")),
        Diagram(
          Rectangle(extent=[-20, 80; 20, -79], style(
              color=41,
              fillColor=49,
              fillPattern=1)),
          Line(points=[-38, 0; -5, 0], style(color=41)),
          Line(points=[40, 0; 5, 0], style(color=41)),
          Text(
            extent=[-17, 21; 17, -20],
            string="D",
            style(color=0)),
          Line(points=[-20, 80; 20, 80; 20, -79; -20, -79; -20, 80], style(
                color=0, thickness=2))));
      PetriNets.Interfaces.FirePortIn inTransition annotation (extent=[-81, -21
            ; -40, 20]);
      PetriNets.Interfaces.SetPortOut outTransition annotation (extent=[40, -10
            ; 60, 10]);
    equation
      //activation of transition
      activated = inTransition.state;

      //activated and delay passed
      delay_passed = activated and ((time - delay) > last_activation_time);

      //fire command
      fire = activated and delay_passed and not outTransition.state;

      //propagate firing to in and output places
      inTransition.fire = fire;
      outTransition.set = fire;

      //set activation time
    algorithm
      when activated then
        last_activation_time := time;
        //Multiplicative Linear Congruential Method
        X1plus := mod(a*X1, m);
        X2plus := mod(a*X2, m);
        //Box-Mueller transformation method for normal distribution
        YnormalStandard := sqrt(-2*ln(X1plus/m))*cos(2*Modelica.Constants.pi*(
          X2plus/m));
        Ynormal := mean + standardDev*YnormalStandard;
        delay := Ynormal;
        X1 := X1plus;
        X2 := X2plus;
      end when;
    end TDelayNormal;
  end Extensions;
end ExtendedPetriNets;
