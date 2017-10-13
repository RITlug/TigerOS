Name:           anaconda-installclass-tigeros
Version:        26
Release:        1%{?dist}
Summary:        @DISTRO_NAME@ installclass for Anaconda

License:        GPLv2+
URL:            https://github.com/RITlug/TigerOS/
Source0:        tigeros.py

BuildRequires:  anaconda-core
BuildRequires:  python3-devel

Requires:       anaconda-core
Supplements:    (tigeros-release and anaconda-core)

%description
This package contains the installclass for TigerOS for
Anaconda.

%prep
# nothing to prep

%build
# Nothing to build

%install
# Install the installclass file
install -Dpm 0644 %{SOURCE0} %{buildroot}%{python3_sitearch}/pyanaconda/installclasses/tigeros.py

%files
%{python3_sitearch}/pyanaconda/installclasses/tigeros.py
%{python3_sitearch}/pyanaconda/installclasses/__pycache__/tigeros.*

%changelog
