Name:           TigerOS-bookmarks
Version:        1
Release:        1%{?dist}
Summary:        TigerOS bookmarks
Group:          Applications/Internet
License:        GFDL
URL:            https://github.com/RITlug/TigerOS
# I had to strip the embedded icons out of the bookmarks file, because they are not 
# distributable under the GFDL. See https://bugzilla.redhat.com/show_bug.cgi?id=433471
Source0:        default-bookmarks.html
BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
BuildArch:      noarch
Provides:       system-bookmarks


%description
This package contains the default bookmarks for TigerOS.

%prep
# We are nihilists, Lebowski.  We believe in nassing.

%build
# We are nihilists, Lebowski.  We believe in nassing.

%install
%{__rm} -rf $RPM_BUILD_ROOT
%{__mkdir_p} $RPM_BUILD_ROOT%{_datadir}/bookmarks
install -p -m 644 %{SOURCE0} $RPM_BUILD_ROOT%{_datadir}/bookmarks


%clean
%{__rm} -rf $RPM_BUILD_ROOT


%files
%defattr(-,root,root,-)
%dir %{_datadir}/bookmarks
%{_datadir}/bookmarks/default-bookmarks.html

%changelog
* Sat Mar 25 2017 Aidan Kahrs <axk4545@rit.edu>
- Initial version

