Name:           tigeros-ff-profile
Version:        1.0
Release:        2%{?dist}
Summary:        TigerOS default profile for Firefox
Group:          Applications/Internet
License:        GPL3
URL:            https://github.com/RITlug/TigerOS
Source0:        tigeros-ff-profile.tar.gz
BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
BuildArch:      noarch
Requires:       firefox

%description
This package contains the default bookmarks for TigerOS.

%prep
%setup -q
%build

%install
%{__rm} -rf %{buildroot}
%{__mkdir_p} %{buildroot}/etc/skel/
cp -r .mozilla/ %{buildroot}/etc/skel/
chmod -R 755 %{buildroot}/etc/skel/.mozilla

%clean
%{__rm} -rf $RPM_BUILD_ROOT


%files
/etc/skel/.mozilla

%changelog
* Wed Aug 30 2017 Aidan Kahrs <axk4545@rit.edu> - 1.0-2
- rebuild for Fedora 26

* Mon May 08 2017 Aidan Kahrs <axk4545@rit.edu> - 1.0-1
- Initial version
