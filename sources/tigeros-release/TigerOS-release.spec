%global release_name TigerOS
%global dist_version 26

Summary:        TigerOS release files
Name:           tigeros-release
Version:        26
Release:        1.0
License:        MIT
Group:          System Environment/Base
Source0:        LICENSE
Source1:        README.developers
Source2:        README.TigerOS-Release-Notes
Source3:        README.license
Source4:        85-display-manager.preset
Source5:        90-default.preset
Source6:        99-default-disable.preset
Obsoletes:      redhat-release
Provides:       redhat-release
Provides:       system-release
Provides:       system-release(%{version})
Requires:       fedora-repos(%{version})
BuildArch:      noarch
Conflicts:      fedora-release

%description
TigerOS release files such as yum configs and various /etc/ files that
define the release. This package explicitly is a replacement for the 
trademarked release package, if you are unable for any reason to abide by the 
trademark restrictions on that release package.

%package notes
Summary:    Release Notes
License:    Open Publication
Group:      System Environment/Base
Provides:   system-release-notes = %{version}-%{release}
Conflicts:  fedora-release-notes

%description notes
TigerOS release notes package. This package explicitly is a replacement 
for the trademarked release-notes package, if you are unable for any reason
to abide by the trademark restrictions on that release-notes 
package. Please note that there is no actual useful content here.


%prep
%setup -c -T
cp -a %{SOURCE0} %{SOURCE1} %{SOURCE2} %{SOURCE3} %{SOURCE4} %{SOURCE5} %{SOURCE6} .

%build

%install
install -d %{buildroot}/etc
echo "TigerOS release %{version} (%{release_name})" > %{buildroot}/etc/fedora-release
echo "cpe:/o:TigerOS:TigerOS:%{version}" > %{buildroot}/etc/system-release-cpe
cp -p %{buildroot}/etc/fedora-release %{buildroot}/etc/issue
echo "Kernel \r on an \m (\l)" >> %{buildroot}/etc/issue
cp -p %{buildroot}/etc/issue %{buildroot}/etc/issue.net
echo >> %{buildroot}/etc/issue
ln -s fedora-release %{buildroot}/etc/redhat-release
ln -s fedora-release %{buildroot}/etc/system-release

mkdir -p %{buildroot}/usr/lib/systemd/system-preset/

cat << EOF >>%{buildroot}/usr/lib/os-release
NAME=TigerOS
VERSION="%{version} (%{release_name})"
ID=TigerOS
VERSION_ID=%{version}
PRETTY_NAME="TigerOS %{version} (%{release_name})"
ANSI_COLOR="0;34"
CPE_NAME="cpe:/o:TigerOS:TigerOS:%{version}"
EOF
# Create the symlink for /etc/os-release
ln -s ../usr/lib/os-release %{buildroot}/etc/os-release

# Set up the dist tag macros
install -d -m 755 %{buildroot}%{_rpmconfigdir}/macros.d
cat >> %{buildroot}%{_rpmconfigdir}/macros.d/macros.dist << EOF
# dist macros.

%%fedora        %{dist_version}
%%dist      .fc%{dist_version}
%%fc%{dist_version}     1
EOF

# Add presets
# Default system wide
install -m 0644 85-display-manager.preset %{buildroot}%{_prefix}/lib/systemd/system-preset/
install -m 0644 90-default.preset %{buildroot}%{_prefix}/lib/systemd/system-preset/
install -m 0644 99-default-disable.preset %{buildroot}%{_prefix}/lib/systemd/system-preset/

%clean
rm -rf %{buildroot}

%files
%defattr(-,root,root,-)
%license LICENSE README.license
%config %attr(0644,root,root) /usr/lib/os-release
/etc/os-release
%config %attr(0644,root,root) /etc/fedora-release
/etc/redhat-release
/etc/system-release
%config %attr(0644,root,root) /etc/system-release-cpe
%config(noreplace) %attr(0644,root,root) /etc/issue
%config(noreplace) %attr(0644,root,root) /etc/issue.net
%attr(0644,root,root) %{_rpmconfigdir}/macros.d/macros.dist
%{_prefix}/lib/systemd/system-preset/85-display-manager.preset
%{_prefix}/lib/systemd/system-preset/90-default.preset
%{_prefix}/lib/systemd/system-preset/99-default-disable.preset

%files notes
%defattr(-,root,root,-)
%doc README.TigerOS-Release-Notes

%changelog
* Wed Aug 30 2017 Aidan Kahrs <axk4545@rit.edu> - 26-1.0
- rebuild for Fedora 26

* Sun Apr 23 2017 Aidan Kahrs <axk4545@rit.edu> 1.0
- initial package for tigeros-release and tigeros-release-notes
