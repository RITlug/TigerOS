Name:           tigeros-scripts
Version:        1.0
Release:        4%{?dist}
Summary:        TigerOS setup scripts
License:        GPLv3
URL:            https://github.com/RITlug/TigerOS
#tarball created with:
#   svn export https://github.com/RITlug/TigerOS/trunk/scripts/ tigeros-scripts-%{version}
#   tar -cf tigeros-scripts.tar.gz tigeros-scripts-%{version}/
Source0:    %{name}.tar.gz
BuildArch:  noarch
BuildRequires: svn
BuildRequires: tar
%description
Custom scripts for the TigerOS Fedora Remix

%prep
%setup -q

%build
echo "We don't need to build"

%install
%{__mkdir_p} %{buildroot}/etc/skel/.config/autostart/
install -p -m 755 tigeros-postinstall.desktop %{buildroot}/etc/skel/.config/autostart/tigeros-postinstall.desktop
%{__mkdir_p} %{buildroot}%{_prefix}/local/bin
install -p -m 755 enablerpmfusion %{buildroot}%{_prefix}/local/bin/enablerpmfusion
install -p -m 755 removal %{buildroot}%{_prefix}/local/bin/removal
install -p -m 755 postinstall %{buildroot}%{_prefix}/local/bin/postinstall
%{__mkdir_p} %{buildroot}%{_prefix}/local/bin/cs
install -p -m 755 cs/idea.sh %{buildroot}%{_prefix}/local/bin/cs/idea.sh
install -p -m 755 cs/jflap.sh %{buildroot}%{_prefix}/local/bin/cs/jflap.sh
install -p -m 755 cs/logisim.sh %{buildroot}%{_prefix}/local/bin/cs/logisim.sh
%{__mkdir_p} %{buildroot}%{_prefix}/local/bin/se
install -p -m 755 se/alloy.sh %{buildroot}%{_prefix}/local/bin/se/alloy.sh
install -p -m 755 se/spin.sh %{buildroot}%{_prefix}/local/bin/se/spin.sh

%files
%{_prefix}/local/bin/enablerpmfusion
%{_prefix}/local/bin/removal
%{_prefix}/local/bin/postinstall
%{_prefix}/local/bin/cs/
%{_prefix}/local/bin/cs/idea.sh
%{_prefix}/local/bin/cs/jflap.sh
%{_prefix}/local/bin/cs/logisim.sh
%{_prefix}/local/bin/se/
%{_prefix}/local/bin/se/alloy.sh
%{_prefix}/local/bin/se/spin.sh
/etc/skel/.config/autostart/tigeros-postinstall.desktop

%changelog
