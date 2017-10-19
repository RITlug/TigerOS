%global uuid dash-to-dock@micxgx.gmail.com
%global gittag 87f46c7c759af5fc83e75237d309947ba3012fa4
%global gitshorttag 87f46c7


Name:           gnome-shell-extension-dash-to-dock
Version:        0.61
Release:        0.git%{gitshorttag}%{?dist}
Summary:        A dock for the GNOME Shell

License:        GPLv2+
URL:            https://github.com/micheleg/dash-to-dock
Source0:        https://github.com/micheleg/dash-to-dock/archive/%{gittag}.tar.gz

BuildRequires:  gettext
BuildRequires:  intltool
BuildRequires:  vala-tools
BuildRequires:  desktop-file-utils
BuildRequires:  pkgconfig(glib-2.0)
BuildRequires:  pkgconfig(gtk+-3.0)
BuildRequires:  pkgconfig(gobject-introspection-1.0)
BuildRequires:  pkgconfig(gom-1.0)
BuildRequires:  pkgconfig(gnome-desktop-3.0)
BuildRequires:  pkgconfig(gstreamer-1.0)
BuildRequires:  pkgconfig(dbus-1)
BuildRequires:  pkgconfig(dbus-glib-1)
BuildRequires:  pkgconfig(libcanberra)
BuildRequires:  pkgconfig(libnotify)
BuildRequires:  pkgconfig(sqlite3)
BuildRequires:  pkgconfig(upower-glib)

Requires:       gnome-shell >= 3.14.0
Requires(post): glib2


%description
A dock for the Gnome Shell. This extension moves the dash out of the overview
transforming it in a dock for an easier launching of applications and a faster
switching between windows and desktops.

%prep
%setup -q -n dash-to-dock-%{gittag}

%install
make install INSTALLBASE=%{buildroot}%{_datadir}/gnome-shell/extensions/ VERSION=%{version}.git%{gittag}

mkdir -p %{buildroot}%{_datadir}/glib-2.0/schemas/
install -m 0644 %{_builddir}/dash-to-dock-%{gittag}/schemas/org.gnome.shell.extensions.dash-to-dock.gschema.xml %{buildroot}%{_datadir}/glib-2.0/schemas/org.gnome.shell.extensions.dash-to-dock.gschema.xml

%post
glib-compile-schemas %{_datadir}/glib-2.0/schemas/ 2>/dev/null

%postun
glib-compile-schemas %{_datadir}/glib-2.0/schemas/ 2>/dev/null

%files
%doc README.md COPYING
%{_datadir}/glib-2.0/schemas/org.gnome.shell.extensions.dash-to-dock.gschema.xml
%{_datadir}/gnome-shell/extensions/%{uuid}/

%changelog
* Wed Oct 18 2017 Aidan Kahrs <axk4545@rit.edu> - 0.61-1.git87f46c7
- Updated to latest upstream.

* Wed Aug  2 2017 Ian Firns <firnsy@kororproject.org> - 0.60.0-1.gitbefc592
- Updated to latest upstream.

* Tue Sep 13 2016 Chris Smart <csmart@kororproject.org> - 0.53-4.git70d3abe
- Support for GNOME 3.22

* Thu Jul 07 2016 Chris Smart <csmart@kororproject.org> - 0.53-3.git1452801
- Set default icon size to 32 instead of 48

* Tue Jul 05 2016 Chris Smart <csmart@kororproject.org> - 0.53-2.git1452801
- Fix dots on icons to show open windows

* Fri May 13 2016 Chris Smart <csmart@kororproject.org> - 0.53-1.git1452801
- Bump to latest upstream version.

* Mon Feb 22 2016 Chris Smart <csmart@kororproject.org> - 0.52-1.gite80e7cf
- Bump to latest upstream version.

* Thu Oct 08 2015 Chris Smart <csmart@kororproject.org> - 0.49-1.git2b48c5b
- Bump to latest upstream version.

* Wed Jul 15 2015 Ian Firns <firnsy@kororproject.org> - 0.46.1-2.git91e7913
- Patch our defaults straight into the plugin.

* Thu Jun  4 2015 Ian Firns <firnsy@kororproject.org> - 0.46.1-1.git91e7913
- Updated to latest upstream.

* Thu Jan  8 2015 Ian Firns <firnsy@kororproject.org> - 0.35.1-2.git8d2ccc7
- Install gschema

* Sun Nov 16 2014 Ian Firns <firnsy@kororproject.org> - 0.35.1-1.git8d2ccc7
- Update to lastest upstream release

* Sun Nov 16 2014 Ian Firns <firnsy@kororproject.org> - 0.35-1.git656e064
- Initial package for Korora
