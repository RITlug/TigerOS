Name:           JFLAP
Version:        7.0
Release:        1%{?dist}
Summary:        The JFLAP formal language tool
License:        JFLAP 7.0 License
URL:            https://www.jflap.org
Source0:    %{name}.tar.gz
BuildArch:  noarch
BuildRequires:  java

%description
JFLAP is a package of graphical tools which can be used as an aid in learning the basic concepts of Formal Languages and Automata Theory. 

%prep
# section for preparation of sources, applying patches
# or other things which can be done before running the build
# The macro setup is used to unpack sources
%setup -n %{name} -n %{name}

%build
# Section for compiling and generally assembling the final pieces.
# Our Makefile builds the project JAR file
make

%install
# Installation into directory prepared by RPM expressed as %{buildroot}
install -p -m 644 jflap.jar %{buildroot}%{_javadir}/jflap.jar

# We use macro %jpackage_script to generate wrapper script for our JAR
# Will be explained in later sections
%jpackage_script jflap "" "" %{name} jflap true
# List of files that this package installs on the system
%files
%{_javadir}/jflap.jar
%{_bindir}/jflap

%changelog
