Name:           tigeros-scripts
Version:        1.0
Release:        1%{?dist}
Summary:        TigerOS setup scripts
License:        GPLv3
URL:            https://github.com/RITlug/TigerOS
Source0:    %{name}.tar.gz
BuildArch:  noarch
BuildRequires: git

%description
JFLAP is a package of graphical tools which can be used as an aid in learning the basic concepts of Formal Languages and Automata Theory. 

%prep
tar -xvf %{_sourcedir}/%{name}.tar.gz -C  %{_sourcedir}

%build
echo "We don't need to build"

%install
%{__mkdir_p} %{buildroot}%{_prefix}/local/tigeros
install -p -m 755 %{_sourcedir}/FusionEnableLauncher.py %{buildroot}%{_prefix}/local/tigeros/FusionEnableLauncher.py
%{__mkdir_p} %{buildroot}%{_prefix}/local/tigeros/cs
install -p -m 755 %{_sourcedir}/cs/idea.sh %{buildroot}%{_prefix}/local/tigeros/cs/idea.sh
install -p -m 755 %{_sourcedir}/cs/jflap.sh %{buildroot}%{_prefix}/local/tigeros/cs/jflap.sh
install -p -m 755 %{_sourcedir}/cs/logisim.sh %{buildroot}%{_prefix}/local/tigeros/cs/logisim.sh
install -p -m 755 %{_sourcedir}/enablerpmfusion.sh %{buildroot}%{_prefix}/local/tigeros/enablerpmfusion.sh
install -p -m 755 %{_sourcedir}/removal %{buildroot}%{_prefix}/local/tigeros/removal
install -p -m 755 %{_sourcedir}/postinstall %{buildroot}%{_prefix}/local/tigeros/postinstall
%{__mkdir_p} %{buildroot}%{_prefix}/local/tigeros/se
install -p -m 755 %{_sourcedir}/se/alloy.sh %{buildroot}%{_prefix}/local/tigeros/se/alloy.sh
install -p -m 755 %{_sourcedir}/se/spin.sh %{buildroot}%{_prefix}/local/tigeros/se/spin.sh

%files
%{_prefix}/local/tigeros/FusionEnableLauncher.py
%{_prefix}/local/tigeros/cs
%{_prefix}/local/tigeros/cs/idea.sh
%{_prefix}/local/tigeros/cs/jflap.sh
%{_prefix}/local/tigeros/cs/logisim.sh
%{_prefix}/local/tigeros/enablerpmfusion.sh
%{_prefix}/local/tigeros/removal
%{_prefix}/local/tigeros/postinstall
%{_prefix}/local/tigeros/se/alloy.sh
%{_prefix}/local/tigeros/se/spin.sh
%changelog
