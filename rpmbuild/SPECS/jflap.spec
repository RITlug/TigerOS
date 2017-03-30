Name:           jflap
Version:        7.0
Release:        1%{?dist}
Summary:        The JFLAP formal language tool
License:        JFLAP 7.0 License
URL:            https://www.jflap.org
Source0:    %{name}.tar.gz
Source1:	%{name}.sh
BuildArch:  noarch
BuildRequires:  java

%description
JFLAP is a package of graphical tools which can be used as an aid in learning the basic concepts of Formal Languages and Automata Theory. 

%prep

%setup -n %{name} -n %{name}

%build
make

%install
%{__mkdir_p} %{buildroot}%{_javadir}
install -p -m 755 JFLAP_With_Source.jar %{buildroot}%{_javadir}/jflap.jar
%{__mkdir_p} %{buildroot}%{_bindir}
install -p -m 755 %{SOURCE1} %{buildroot}%{_bindir}/jflap 

%files
%{_javadir}/jflap.jar
%{_bindir}/jflap

%changelog
