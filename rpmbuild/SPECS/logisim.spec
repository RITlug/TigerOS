Name:           jflap
Version:        7.0
Release:        1%{?dist}
Summary:        A graphical tool for designing and simulating logic circuits
License:        GPLv2
URL:            http://www.cburch.com/logisim/index.html
Source0:    %{name}.tar.gz
BuildArch:  noarch
BuildRequires:  java

%description

%prep

%setup -n %{name} -n %{name}

%build
make

%install
%{__mkdir_p} %{buildroot}%{_javadir}
install -p -m 755 JFLAP_With_Source.jar %{buildroot}%{_javadir}/logisim.jar
%{__mkdir_p} %{buildroot}%{_bindir}
install -p -m 755 %{_sourcedir}/jflap.sh %{buildroot}%{_bindir}/jflap 
%{__mkdir_p} %{buildroot}%{_datadir}/icons
install -p -m 644 %{_sourcedir}/logisim.jpg %{buildroot}%{_datadir}/icons/logisim.jpg 
%{__mkdir_p} %{buildroot}%{_datadir}/applications
install -p -m 644 %{_sourcedir}/logisim.desktop %{buildroot}%{_datadir}/applications/logisim.desktop

%files
%{_javadir}/logisim.jar
%{_bindir}/logisim
%{_datadir}/applications/logisim.desktop
%{_datadir}/icons/logisim.jpg

%changelog
