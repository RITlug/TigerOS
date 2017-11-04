Name:           tigeros-ui-tweaks
Version:        1.0
Release:        1{?dist}
Summary:        Various UI and UX related changes for TigerOS

License:        GPLv3
URL:            https://github.com/RITlug/TigerOS
Source0:        {name}-{version}.tar.gz

Requires:       tigeros-backgrounds
Requires:		tigeros-release
Requires:		gnome-shell-extension-dash-to-dock


%description
Various UI tweaks and modification for TigerOS.

%prep

%install


%post

%files

%changelog
*  Nov 3 2017 Aidan Kahrs <axk4545@rit.edu> - 1.0-1
- Initial package for TigerOS
